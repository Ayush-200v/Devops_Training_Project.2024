### **Build the AMI with Packer**
   ```bash
   packer init ami.pkr.hcl 
   packer validate ami.hcl
   packer build ami.hcl
   ```