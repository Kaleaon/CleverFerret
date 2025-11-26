.class public Lcom/flyersoft/moonreaderp/SelectFileAct;
.super Landroid/app/Activity;
.source "SelectFileAct.java"


# static fields
.field private static onResult:Lcom/flyersoft/tools/T$FileResultOK;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method public static selectFile(Landroid/content/Context;Lcom/flyersoft/tools/T$FileResultOK;)V
    .locals 1

    .line 19
    sput-object p1, Lcom/flyersoft/moonreaderp/SelectFileAct;->onResult:Lcom/flyersoft/tools/T$FileResultOK;

    .line 20
    new-instance p1, Landroid/content/Intent;

    const-class v0, Lcom/flyersoft/moonreaderp/SelectFileAct;

    invoke-direct {p1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 5

    const-string v0, ""

    const/16 v1, 0x402

    const/4 v2, 0x0

    if-ne p1, v1, :cond_2

    const/4 p1, -0x1

    if-ne p2, p1, :cond_2

    if-eqz p3, :cond_2

    .line 40
    :try_start_0
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    .line 41
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/SelectFileAct;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    invoke-virtual {p2, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p2

    .line 42
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/SelectFileAct;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p3

    invoke-static {p3, p1}, Lcom/flyersoft/tools/T;->getEmailFileName(Landroid/content/ContentResolver;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p1

    .line 43
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result p3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, 0x1

    const-string v3, "/"

    if-gt p3, v1, :cond_1

    .line 44
    :try_start_1
    invoke-static {p2}, Lcom/flyersoft/tools/T;->inputStream2Bytes(Ljava/io/InputStream;)[B

    move-result-object p2

    .line 45
    invoke-static {p2}, Lcom/flyersoft/tools/T;->bytes2InputStream([B)Ljava/io/InputStream;

    move-result-object p3

    const-string v1, "UTF-8"

    const/4 v4, 0x2

    invoke-static {p3, v1, v4}, Lcom/flyersoft/tools/T;->inputStream2String(Ljava/io/InputStream;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p3

    .line 46
    invoke-static {p3}, Lcom/flyersoft/tools/T;->getFileTypeFromBinary(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 47
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 48
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 49
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 50
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 51
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/SelectFileAct;->getExternalCacheDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 53
    invoke-static {p2, p1}, Lcom/flyersoft/tools/T;->bytes2File([BLjava/lang/String;)Z

    goto :goto_0

    .line 55
    :cond_1
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/SelectFileAct;->getExternalCacheDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 56
    invoke-static {p2, p1}, Lcom/flyersoft/tools/T;->inputStream2File(Ljava/io/InputStream;Ljava/lang/String;)Z

    .line 58
    :goto_0
    sget-object p2, Lcom/flyersoft/moonreaderp/SelectFileAct;->onResult:Lcom/flyersoft/tools/T$FileResultOK;

    invoke-interface {p2, p1}, Lcom/flyersoft/tools/T$FileResultOK;->isResultOk(Ljava/lang/String;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p1

    .line 60
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 61
    sget-object p1, Lcom/flyersoft/moonreaderp/SelectFileAct;->onResult:Lcom/flyersoft/tools/T$FileResultOK;

    invoke-interface {p1, v2}, Lcom/flyersoft/tools/T$FileResultOK;->isResultOk(Ljava/lang/String;)Z

    goto :goto_1

    .line 64
    :cond_2
    sget-object p1, Lcom/flyersoft/moonreaderp/SelectFileAct;->onResult:Lcom/flyersoft/tools/T$FileResultOK;

    invoke-interface {p1, v2}, Lcom/flyersoft/tools/T$FileResultOK;->isResultOk(Ljava/lang/String;)Z

    .line 66
    :goto_1
    sput-object v2, Lcom/flyersoft/moonreaderp/SelectFileAct;->onResult:Lcom/flyersoft/tools/T$FileResultOK;

    .line 67
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/SelectFileAct;->finish()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 25
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 26
    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.intent.action.OPEN_DOCUMENT"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v0, "android.intent.category.OPENABLE"

    .line 27
    invoke-virtual {p1, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const-string v0, "*/*"

    .line 28
    invoke-virtual {p1, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const-string v0, "android.intent.extra.ALLOW_MULTIPLE"

    const/4 v1, 0x0

    .line 29
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p1

    .line 30
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    .line 31
    invoke-virtual {p1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    :cond_0
    const/16 v0, 0x402

    .line 33
    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/moonreaderp/SelectFileAct;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method
