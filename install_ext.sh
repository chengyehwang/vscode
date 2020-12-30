publisher="ms-python"
extension_name="python"
version="2020.11.371526539"

wget "https://${publisher}.gallery.vsassets.io/_apis/public/gallery/publisher/${publisher}/extension/${extension_name}/${version}/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage"
mv Microsoft.VisualStudio.Services.VSIXPackage /opt/${publisher}.vsix
#code-server --install-extension ${publisher}.vsix --extensions-dir /vscode/ext

publisher="ms-toolsai"
extension_name="jupyter"
version="2020.11.399280825"

wget "https://${publisher}.gallery.vsassets.io/_apis/public/gallery/publisher/${publisher}/extension/${extension_name}/${version}/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage"
mv Microsoft.VisualStudio.Services.VSIXPackage /opt/${publisher}.vsix
#code-server --install-extension ${publisher}.vsix --extensions-dir /vscode/ext

echo "end"
