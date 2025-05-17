var meta;

if (file_exists("aaastateloadedeveryonepanic"))
{
    meta = file_text_open_read("tas.meta")
    reRecordCount = real(file_text_read_string(meta))
    file_text_close(meta)
    file_delete("aaastateloadedeveryonepanic")
}
