.class public Lcom/flyersoft/moonreaderp/SelectImageAct;
.super Landroid/app/Activity;
.source "SelectImageAct.java"


# static fields
.field private static deleteSaveToIfFailed:Z

.field private static imageSaveTo:Ljava/lang/String;

.field private static onResult:Lcom/flyersoft/tools/T$FileResultOK;


# instance fields
.field private mImageUri:Landroid/net/Uri;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private crop()V
    .locals 6

    .line 88
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Ljava/io/File;

    sget-object v2, Lcom/flyersoft/moonreaderp/SelectImageAct;->imageSaveTo:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/flyersoft/tools/A;->getUriProvider(Landroid/content/Context;Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    .line 89
    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.android.camera.action.CROP"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x1

    .line 90
    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const/4 v3, 0x2

    .line 91
    invoke-virtual {v1, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 92
    const-string v3, "image/*"

    invoke-virtual {v1, v0, v3}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 97
    const-string v3, "crop"

    const-string v4, "true"

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 98
    const-string v3, "aspectX"

    const-wide v4, 0x3fb999999999999aL    # 0.1

    invoke-virtual {v1, v3, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;D)Landroid/content/Intent;

    .line 99
    const-string v3, "aspectY"

    invoke-virtual {v1, v3, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;D)Landroid/content/Intent;

    .line 102
    const-string v3, "scale"

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 115
    const-string v3, "return-data"

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 116
    const-string v3, "output"

    invoke-virtual {v1, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 117
    sget-object v0, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    invoke-virtual {v0}, Landroid/graphics/Bitmap$CompressFormat;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v3, "outputFormat"

    invoke-virtual {v1, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 118
    const-string v0, "noFaceDetection"

    invoke-virtual {v1, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const/16 v0, 0x403

    .line 133
    invoke-virtual {p0, v1, v0}, Lcom/flyersoft/moonreaderp/SelectImageAct;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method private returnImage(Z)V
    .locals 2

    .line 33
    sget-object v0, Lcom/flyersoft/moonreaderp/SelectImageAct;->onResult:Lcom/flyersoft/tools/T$FileResultOK;

    if-eqz v0, :cond_2

    const/4 v1, 0x0

    if-eqz p1, :cond_1

    .line 35
    sget-object p1, Lcom/flyersoft/moonreaderp/SelectImageAct;->imageSaveTo:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 36
    sget-object p1, Lcom/flyersoft/moonreaderp/SelectImageAct;->onResult:Lcom/flyersoft/tools/T$FileResultOK;

    sget-object v0, Lcom/flyersoft/moonreaderp/SelectImageAct;->imageSaveTo:Ljava/lang/String;

    invoke-interface {p1, v0}, Lcom/flyersoft/tools/T$FileResultOK;->isResultOk(Ljava/lang/String;)Z

    goto :goto_0

    .line 38
    :cond_0
    sget-object p1, Lcom/flyersoft/moonreaderp/SelectImageAct;->onResult:Lcom/flyersoft/tools/T$FileResultOK;

    invoke-interface {p1, v1}, Lcom/flyersoft/tools/T$FileResultOK;->isResultOk(Ljava/lang/String;)Z

    goto :goto_0

    .line 40
    :cond_1
    invoke-interface {v0, v1}, Lcom/flyersoft/tools/T$FileResultOK;->isResultOk(Ljava/lang/String;)Z

    .line 42
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/SelectImageAct;->finish()V

    return-void
.end method

.method public static selectImage(Landroid/content/Context;Ljava/lang/String;ZLcom/flyersoft/tools/T$FileResultOK;)V
    .locals 1

    const/4 v0, 0x1

    .line 24
    invoke-static {v0}, Lcom/flyersoft/tools/A;->permissionOk(Z)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 26
    :cond_0
    sput-object p1, Lcom/flyersoft/moonreaderp/SelectImageAct;->imageSaveTo:Ljava/lang/String;

    .line 27
    sput-object p3, Lcom/flyersoft/moonreaderp/SelectImageAct;->onResult:Lcom/flyersoft/tools/T$FileResultOK;

    .line 28
    sput-boolean p2, Lcom/flyersoft/moonreaderp/SelectImageAct;->deleteSaveToIfFailed:Z

    .line 29
    new-instance p1, Landroid/content/Intent;

    const-class p2, Lcom/flyersoft/moonreaderp/SelectImageAct;

    invoke-direct {p1, p0, p2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 4

    .line 56
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string v3, "requestCode"

    aput-object v3, v1, v2

    const/4 v3, 0x1

    aput-object v0, v1, v3

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    const/16 v0, 0x402

    const/4 v1, -0x1

    if-ne p1, v0, :cond_0

    if-ne p2, v1, :cond_0

    if-eqz p3, :cond_0

    .line 60
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    .line 63
    :try_start_0
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/SelectImageAct;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    invoke-virtual {p2, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p1

    .line 64
    sget-object p2, Lcom/flyersoft/moonreaderp/SelectImageAct;->imageSaveTo:Ljava/lang/String;

    invoke-static {p1, p2}, Lcom/flyersoft/tools/T;->inputStream2File(Ljava/io/InputStream;Ljava/lang/String;)Z

    .line 65
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/SelectImageAct;->crop()V

    .line 66
    new-array p1, v3, [Ljava/lang/Object;

    const-string p2, "show crop"

    aput-object p2, p1, v2

    invoke-static {p1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 68
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 69
    invoke-static {p1}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v3}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;I)V

    .line 70
    invoke-direct {p0, v2}, Lcom/flyersoft/moonreaderp/SelectImageAct;->returnImage(Z)V

    :goto_0
    return-void

    :cond_0
    const/16 p3, 0x403

    if-ne p1, p3, :cond_1

    if-ne p2, v1, :cond_1

    .line 73
    new-array p1, v3, [Ljava/lang/Object;

    const-string p2, "return image"

    aput-object p2, p1, v2

    invoke-static {p1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 74
    invoke-direct {p0, v3}, Lcom/flyersoft/moonreaderp/SelectImageAct;->returnImage(Z)V

    return-void

    .line 76
    :cond_1
    new-array p1, v3, [Ljava/lang/Object;

    const-string p2, "cancel image selection"

    aput-object p2, p1, v2

    invoke-static {p1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 77
    sget-boolean p1, Lcom/flyersoft/moonreaderp/SelectImageAct;->deleteSaveToIfFailed:Z

    if-eqz p1, :cond_2

    .line 78
    sget-object p1, Lcom/flyersoft/moonreaderp/SelectImageAct;->imageSaveTo:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    .line 79
    :cond_2
    invoke-direct {p0, v2}, Lcom/flyersoft/moonreaderp/SelectImageAct;->returnImage(Z)V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 47
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 48
    invoke-static {}, Lcom/flyersoft/tools/T;->disableUriExpose()V

    .line 49
    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.intent.action.GET_CONTENT"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 50
    const-string v0, "image/*"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const/16 v0, 0x402

    .line 51
    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/moonreaderp/SelectImageAct;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method
