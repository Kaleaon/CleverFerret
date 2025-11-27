.class public Lcom/radaee/util/CaptureSignature;
.super Landroid/app/Activity;
.source "CaptureSignature.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/radaee/util/CaptureSignature$CaptureSignatureListener;
    }
.end annotation


# static fields
.field public static final FIT_SIGNATURE_BITMAP:Ljava/lang/String; = "FIT_SIGNATURE_BITMAP"

.field public static final SIGNATURE_PAD_DESCR:Ljava/lang/String; = "SIGNATURE_PAD_DESCR"


# instance fields
.field private mClearButton:Landroid/widget/Button;

.field private mSaveButton:Landroid/widget/Button;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private adjustWindowSize()V
    .locals 3

    .line 68
    invoke-virtual {p0}, Lcom/radaee/util/CaptureSignature;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/radaee/viewlib/R$bool;->landscape_only:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 69
    invoke-virtual {p0}, Lcom/radaee/util/CaptureSignature;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->smallestScreenWidthDp:I

    int-to-float v0, v0

    .line 70
    invoke-virtual {p0}, Lcom/radaee/util/CaptureSignature;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    mul-float v0, v0, v1

    const v1, 0x3f666666    # 0.9f

    mul-float v0, v0, v1

    float-to-int v0, v0

    .line 71
    invoke-virtual {p0}, Lcom/radaee/util/CaptureSignature;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    .line 72
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/view/WindowManager$LayoutParams;

    .line 73
    iput v0, v2, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 75
    iput v0, v2, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 76
    invoke-virtual {p0}, Lcom/radaee/util/CaptureSignature;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v0

    invoke-interface {v0, v1, v2}, Landroid/view/WindowManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_0
    return-void
.end method

.method private initLayout()V
    .locals 3

    .line 81
    sget v0, Lcom/radaee/viewlib/R$id;->clear_button:I

    invoke-virtual {p0, v0}, Lcom/radaee/util/CaptureSignature;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/radaee/util/CaptureSignature;->mClearButton:Landroid/widget/Button;

    .line 82
    sget v0, Lcom/radaee/viewlib/R$id;->save_button:I

    invoke-virtual {p0, v0}, Lcom/radaee/util/CaptureSignature;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/radaee/util/CaptureSignature;->mSaveButton:Landroid/widget/Button;

    .line 84
    sget v0, Lcom/radaee/viewlib/R$id;->signature_pad_description:I

    invoke-virtual {p0, v0}, Lcom/radaee/util/CaptureSignature;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/radaee/util/CaptureSignature;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "SIGNATURE_PAD_DESCR"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 114
    iget-object v0, p0, Lcom/radaee/util/CaptureSignature;->mClearButton:Landroid/widget/Button;

    new-instance v1, Lcom/radaee/util/CaptureSignature$1;

    invoke-direct {v1, p0}, Lcom/radaee/util/CaptureSignature$1;-><init>(Lcom/radaee/util/CaptureSignature;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 121
    iget-object v0, p0, Lcom/radaee/util/CaptureSignature;->mSaveButton:Landroid/widget/Button;

    new-instance v1, Lcom/radaee/util/CaptureSignature$2;

    invoke-direct {v1, p0}, Lcom/radaee/util/CaptureSignature$2;-><init>(Lcom/radaee/util/CaptureSignature;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public onAttachedToWindow()V
    .locals 0

    .line 62
    invoke-super {p0}, Landroid/app/Activity;->onAttachedToWindow()V

    .line 64
    invoke-direct {p0}, Lcom/radaee/util/CaptureSignature;->adjustWindowSize()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 36
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    .line 38
    invoke-virtual {p0, p1}, Lcom/radaee/util/CaptureSignature;->requestWindowFeature(I)Z

    .line 39
    sget p1, Lcom/radaee/viewlib/R$layout;->signature_pad:I

    invoke-virtual {p0, p1}, Lcom/radaee/util/CaptureSignature;->setContentView(I)V

    .line 41
    invoke-virtual {p0}, Lcom/radaee/util/CaptureSignature;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget v0, Lcom/radaee/viewlib/R$bool;->landscape_only:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    .line 42
    invoke-virtual {p0, p1}, Lcom/radaee/util/CaptureSignature;->setRequestedOrientation(I)V

    .line 44
    :cond_0
    invoke-direct {p0}, Lcom/radaee/util/CaptureSignature;->initLayout()V

    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Bundle;)V
    .locals 0

    .line 57
    invoke-super {p0, p1}, Landroid/app/Activity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 0

    .line 50
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    return-void
.end method

.method public setTheme(I)V
    .locals 2

    .line 31
    invoke-virtual {p0}, Lcom/radaee/util/CaptureSignature;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/radaee/viewlib/R$bool;->landscape_only:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget p1, Lcom/radaee/viewlib/R$style;->AppBaseTheme:I

    :cond_0
    invoke-super {p0, p1}, Landroid/app/Activity;->setTheme(I)V

    return-void
.end method
