.class public Lcom/dropbox/core/v2/files/PaperUpdateUploader;
.super Lcom/dropbox/core/DbxUploader;
.source "PaperUpdateUploader.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/DbxUploader<",
        "Lcom/dropbox/core/v2/files/PaperUpdateResult;",
        "Lcom/dropbox/core/v2/files/PaperUpdateError;",
        "Lcom/dropbox/core/v2/files/PaperUpdateErrorException;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/dropbox/core/http/HttpRequestor$Uploader;Ljava/lang/String;)V
    .locals 2

    .line 33
    sget-object v0, Lcom/dropbox/core/v2/files/PaperUpdateResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/PaperUpdateResult$Serializer;

    sget-object v1, Lcom/dropbox/core/v2/files/PaperUpdateError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/PaperUpdateError$Serializer;

    invoke-direct {p0, p1, v0, v1, p2}, Lcom/dropbox/core/DbxUploader;-><init>(Lcom/dropbox/core/http/HttpRequestor$Uploader;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic newException(Lcom/dropbox/core/DbxWrappedException;)Lcom/dropbox/core/DbxApiException;
    .locals 0

    .line 23
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/files/PaperUpdateUploader;->newException(Lcom/dropbox/core/DbxWrappedException;)Lcom/dropbox/core/v2/files/PaperUpdateErrorException;

    move-result-object p1

    return-object p1
.end method

.method protected newException(Lcom/dropbox/core/DbxWrappedException;)Lcom/dropbox/core/v2/files/PaperUpdateErrorException;
    .locals 4

    .line 37
    new-instance v0, Lcom/dropbox/core/v2/files/PaperUpdateErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/PaperUpdateError;

    const-string v3, "2/files/paper/update"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/files/PaperUpdateErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/files/PaperUpdateError;)V

    return-object v0
.end method
