#!/bin/bash

FILE=".github/workflows/02-workflow-events.yaml"

echo "🔎 Checking workflow file..."

# 1. Check file exists
if [ ! -f "$FILE" ]; then
  echo "❌ Workflow file not found at $FILE"
  exit 1
fi

echo "✅ Workflow file exists"

# 2. Check workflow name
grep -q "name: 02 - Eventos" "$FILE"
if [ $? -ne 0 ]; then
  echo "❌ Workflow name is incorrect"
  exit 1
fi
echo "✅ Workflow name correct"

# 3. Check push trigger
grep -q "push:" "$FILE"
if [ $? -ne 0 ]; then
  echo "❌ push trigger not found"
  exit 1
fi
echo "✅ push trigger found"

# 4. Check pull_request trigger
grep -q "pull_request:" "$FILE"
if [ $? -ne 0 ]; then
  echo "❌ pull_request trigger not found"
  exit 1
fi
echo "✅ pull_request trigger found"

# 5. Check schedule trigger
grep -q "schedule:" "$FILE"
if [ $? -ne 0 ]; then
  echo "❌ schedule trigger not found"
  exit 1
fi
echo "✅ schedule trigger found"

# 6. Check workflow_dispatch trigger
grep -q "workflow_dispatch:" "$FILE"
if [ $? -ne 0 ]; then
  echo "❌ workflow_dispatch trigger not found"
  exit 1
fi
echo "✅ workflow_dispatch trigger found"

# 7. Check job name
grep -q "echo:" "$FILE"
if [ $? -ne 0 ]; then
  echo "❌ Job 'echo' not found"
  exit 1
fi
echo "✅ Job 'echo' found"

# 8. Check runner
grep -q "runs-on: ubuntu-latest" "$FILE"
if [ $? -ne 0 ]; then
  echo "❌ Runner is not ubuntu-latest"
  exit 1
fi
echo "✅ Runner correct"

# 9. Check event_name echo
grep -q "github.event_name" "$FILE"
if [ $? -ne 0 ]; then
  echo "❌ github.event_name not used"
  exit 1
fi
echo "✅ github.event_name used"

echo "🎉 All checks passed!"
exit 0
