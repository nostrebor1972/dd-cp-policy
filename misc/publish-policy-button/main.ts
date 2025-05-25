import { serve } from "https://deno.land/std@0.203.0/http/server.ts";


// path /publish should show a button to publish the policy on HTML page
const htmlContent = `
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Publish Policy</title>
</head>
<body>
    <h1>Publish Policy</h1>
    <button id="publishButton">Publish</button>
    <script>
        document.getElementById('publishButton').addEventListener('click', () => {
            fetch('/publish', { method: 'POST' })
                .then(response => response.text())
                .then(data => alert(data))
                .catch(error => console.error('Error:', error));
        });
    </script>
</body>
</html>
`;

serve((req) => {
    const { pathname } = new URL(req.url, `http://${req.headers.get("host") || "localhost"}`);
    if (req.method === "GET" && pathname === "/publish") {
        return new Response(htmlContent, {
            headers: { "Content-Type": "text/html" },
        });
    }
    if (req.method === "POST" && pathname === "/publish") {

//         # ==== CONFIGURATION ====
// #GITHUB_TOKEN="ghp_your_personal_access_token_here"

// OWNER="mkol5222"
// REPO="dd-cp-policy"
// WORKFLOW_FILE="apply.yml"  # Or you can use the workflow ID
// REF="main"  # Branch or tag name
// INPUTS='{}'  # Optional workflow inputs, or leave empty '{}'

// # ==== API CALL ====
// curl -v  -X POST \
//   -H "Authorization: Bearer $TRIGGER_GITHUB_TOKEN" \
//   -H "Accept: application/vnd.github+json" \
//   https://api.github.com/repos/$OWNER/$REPO/actions/workflows/$WORKFLOW_FILE/dispatches \
//   -d "$(jq -n --arg ref "$REF" --argjson inputs "$INPUTS" '{ref: $ref, inputs: $inputs}')" 

        const GITHUB_TOKEN = Deno.env.get("TRIGGER_GITHUB_TOKEN");
        if (!GITHUB_TOKEN) {
            return new Response("TRIGGER_GITHUB_TOKEN is not set in environment variables.", {
                status: 500,
                headers: { "Content-Type": "text/plain" },
            });
        }
        
        const OWNER = "mkol5222";
        const REPO = "dd-cp-policy";
        const WORKFLOW_FILE = "apply.yml";  
        const REF = "main";
        const INPUTS = '{}';  // Optional workflow inputs, or leave empty '{}'
        
        const response = fetch(`https://api.github.com/repos/${OWNER}/${REPO}/actions/workflows/${WORKFLOW_FILE}/dispatches`, { 
            method: "POST",
            headers: {
                Authorization: `Bearer ${GITHUB_TOKEN}`,
                Accept: "application/vnd.github+json",
                "Content-Type": "application/json",
            },
            body: JSON.stringify({ ref: REF, inputs: JSON.parse(INPUTS) }),
        });

        return new Response("Policy published successfully!", {
            headers: { "Content-Type": "text/plain" },
        });
    }
    return new Response("Welcome to the Publish Policy Button Service!", {
        headers: { "Content-Type": "text/plain" },
    });
});
