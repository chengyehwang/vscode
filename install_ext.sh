publisher="ms-python"
extension_name="python"
version="2020.12.424452561"

wget "https://${publisher}.gallery.vsassets.io/_apis/public/gallery/publisher/${publisher}/extension/${extension_name}/${version}/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage"
mv Microsoft.VisualStudio.Services.VSIXPackage ${publisher}.vsix
code-server --install-extension ${publisher}.vsix

publisher="ms-toolsai"
extension_name="jupyter"
version="2020.12.414227025"

wget "https://${publisher}.gallery.vsassets.io/_apis/public/gallery/publisher/${publisher}/extension/${extension_name}/${version}/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage"
mv Microsoft.VisualStudio.Services.VSIXPackage ${publisher}.vsix
code-server --install-extension ${publisher}.vsix

