.class public Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;
.super Ljava/lang/Object;
.source "FingerprintVerifyManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private callback:Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;

.field private cancelBtnText:Ljava/lang/String;

.field private cancelTextColor:I

.field private context:Landroid/app/Activity;

.field private description:Ljava/lang/String;

.field private enableAndroidP:Z

.field private fingerprintColor:I

.field private subTitle:Ljava/lang/String;

.field private title:Ljava/lang/String;

.field private usepwdTextColor:I

.field private usepwdVisible:Z


# direct methods
.method static bridge synthetic -$$Nest$fgetcallback(Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;)Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;
    .locals 0

    iget-object p0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;->callback:Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetcancelBtnText(Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;->cancelBtnText:Ljava/lang/String;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetcancelTextColor(Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;)I
    .locals 0

    iget p0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;->cancelTextColor:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetcontext(Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;)Landroid/app/Activity;
    .locals 0

    iget-object p0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;->context:Landroid/app/Activity;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetdescription(Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;->description:Ljava/lang/String;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetenableAndroidP(Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;->enableAndroidP:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetfingerprintColor(Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;)I
    .locals 0

    iget p0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;->fingerprintColor:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetsubTitle(Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;->subTitle:Ljava/lang/String;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgettitle(Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;->title:Ljava/lang/String;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetusepwdTextColor(Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;)I
    .locals 0

    iget p0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;->usepwdTextColor:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetusepwdVisible(Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;->usepwdVisible:Z

    return p0
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .locals 0

    .line 122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 123
    iput-object p1, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;->context:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public build()Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager;
    .locals 1

    .line 232
    new-instance v0, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager;

    invoke-direct {v0, p0}, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager;-><init>(Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;)V

    return-object v0
.end method

.method public callback(Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;)Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;
    .locals 0

    .line 132
    iput-object p1, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;->callback:Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;

    return-object p0
.end method

.method public cancelBtnText(Ljava/lang/String;)Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;
    .locals 0

    .line 222
    iput-object p1, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;->cancelBtnText:Ljava/lang/String;

    return-object p0
.end method

.method public cancelTextColor(I)Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;
    .locals 0

    .line 142
    iput p1, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;->cancelTextColor:I

    return-object p0
.end method

.method public description(Ljava/lang/String;)Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;
    .locals 0

    .line 212
    iput-object p1, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;->description:Ljava/lang/String;

    return-object p0
.end method

.method public enableAndroidP(Z)Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;
    .locals 0

    .line 182
    iput-boolean p1, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;->enableAndroidP:Z

    return-object p0
.end method

.method public fingerprintColor(I)Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;
    .locals 0

    .line 162
    iput p1, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;->fingerprintColor:I

    return-object p0
.end method

.method public subTitle(Ljava/lang/String;)Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;
    .locals 0

    .line 202
    iput-object p1, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;->subTitle:Ljava/lang/String;

    return-object p0
.end method

.method public title(Ljava/lang/String;)Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;
    .locals 0

    .line 192
    iput-object p1, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;->title:Ljava/lang/String;

    return-object p0
.end method

.method public usepwdTextColor(I)Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;
    .locals 0

    .line 152
    iput p1, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;->usepwdTextColor:I

    return-object p0
.end method

.method public usepwdVisible(Z)Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;
    .locals 0

    .line 172
    iput-boolean p1, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;->usepwdVisible:Z

    return-object p0
.end method
