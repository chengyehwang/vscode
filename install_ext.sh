for index in {1..100};
do
if [ $index == 2 ]
then
    publisher="ms-python"
    extension_name="python"
    version="2020.12.424452561"
    #version="2020.11.371526539"
elif [ $index == 1 ]
then
    publisher="ms-toolsai"
    extension_name="jupyter"
    version="2020.12.414227025"
    #version="2020.11.399280825"
elif [ $index == 3 ]
then
    publisher="RandomFractalsInc"
    extension_name="vscode-vega-viewer"
    version="9.4.0"
else
    exit 0
fi
wget "https://${publisher}.gallery.vsassets.io/_apis/public/gallery/publisher/${publisher}/extension/${extension_name}/${version}/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage"
mv Microsoft.VisualStudio.Services.VSIXPackage /opt/local/${publisher}.vsix
code-server --install-extension /opt/local/${publisher}.vsix --extensions-dir /opt/ext --disable-update-check --force --user-data-dir /opt/local
ls /opt/ext
done

echo "end"
