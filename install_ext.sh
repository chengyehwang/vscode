publisher="ms-python"
extension_name="python"
version="2020.5.86806"

wget "https://${publisher}.gallery.vsassets.io/_apis/public/gallery/publisher/${publisher}/extension/${extension_name}/${version}/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage"
mv Microsoft.VisualStudio.Services.VSIXPackage /opt/${publisher}.vsix
#code-server --install-extension ${publisher}.vsix --extensions-dir /vscode/ext

publisher="ms-toolsai"
extension_name="jupyter"
version="2020.12.1"

wget "https://${publisher}.gallery.vsassets.io/_apis/public/gallery/publisher/${publisher}/extension/${extension_name}/${version}/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage"
mv Microsoft.VisualStudio.Services.VSIXPackage /opt/${publisher}.vsix
#code-server --install-extension ${publisher}.vsix --extensions-dir /vscode/ext

echo "end"
