
import { resolvePlutusScriptAddress } from "@meshsdk/core";
import type { PlutusScript } from "@meshsdk/core";
import fs from "node:fs";
import "dotenv/config";

const blueprint = JSON.parse(fs.readFileSync("./plutus.json", "utf-8"));

async function main() {
  const validator = blueprint.validators[0];
  if (!validator) {
    throw new Error("Validator not found in blueprint");
  }

  const script: PlutusScript = {
    code: validator.compiledCode,
    version: "V3",
  };

  const address = resolvePlutusScriptAddress(script, 0); // 0 for Preprod
  
  console.log("Smart Contract Address:", address);
  console.log("Validator Hash:", validator.hash);
}

main();
