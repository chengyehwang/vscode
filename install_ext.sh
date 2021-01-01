for index in {1..100};
do
if [ $index == 1 ]
then
    publisher="ms-python"
    extension_name="python"
    version="2020.11.371526539"
elif [ $index == 2 ]
then
    publisher="ms-toolsai"
    extension_name="jupyter"
    version="2020.11.399280825"
else
    exit 0
fi
wget "https://${publisher}.gallery.vsassets.io/_apis/public/gallery/publisher/${publisher}/extension/${extension_name}/${version}/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage"
mv Microsoft.VisualStudio.Services.VSIXPackage /opt/${publisher}.vsix
code-server --install-extension /opt/${publisher}.vsix --extensions-dir /opt/ext --disable-update-check --force

done

echo "end"
