# waypoint
This is the demo used for Hashitalks 2022

### Create Civo Kubernetes cluster 
`civo k3s create waypoint-demo-ht --wait`

### Save the Kubeconfig file
`civo k3s config waypoint-demo-ht --save --local-path /Users/saiyampathak/civo/hashitalk`

### Export KUBECONFIG 
`export KUBECONFIG=/Users/saiyampathak/civo/hashitalk`

### Waypoint install 
`waypoint install --platform=kubernetes --accept-tos`

### Waypoint init 
`waypoint init`

### Waypoint up
`waypoint up`

### GitOps 
open the UI 
`waypoint ui -authenticate`
Create New Project 
![image](https://user-images.githubusercontent.com/8190114/154398736-616cf44f-34a4-4bdd-823f-555b8040a2c1.png)

Give a project name and ntick connect to repository
![image](https://user-images.githubusercontent.com/8190114/154398810-98edea6f-1a88-4ec3-a22e-978c3fe4b02d.png)

Enter the details 
![image](https://user-images.githubusercontent.com/8190114/154398877-76b41bae-cdcd-4178-9c5b-161e2de252ab.png)

Add the input variables for Docker registry authentication to push the image
![image](https://user-images.githubusercontent.com/8190114/154398966-8f64692e-5aa4-418c-927e-83dca4bcfdf0.png)

Congratulations, you have enabled GitOps, now every commit made to main will trigger the `waypoint.hcl` steps.

### Workspace creation 
`waypoint workspace create w2`

### OIDC
- Create the app in OAuth consent screen 
- Add OIDC credential to obtain the ClientID and Secret under the credentials page 
- Create the auth method 

```
waypoint auth-method set oidc \
  -client-id=your-client-id \
  -client-secret=Your-secret \
  -issuer=https://accounts.google.com -allowed-redirect-uri="https://169899bf-489d-4231-988d-2eb7188e98d5.k8s.civo.com:9702/auth/oidc-callback"\
  google
```
waypoint project apply -git-url= -git-username=git -waypoint-hcl= -data-source=git demo
