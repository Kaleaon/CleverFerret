.class Lcom/flyersoft/moonreaderp/PrefMisc$49;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->showFullScreenSettings(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefMisc;Z)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$preFitCutout:I

.field final synthetic val$preFullscreen:Z

.field final synthetic val$preFullscreenWithStatus:Z

.field final synthetic val$preImmersive:Z

.field final synthetic val$pref:Lcom/flyersoft/moonreaderp/PrefMisc;


# direct methods
.method constructor <init>(ZZZILcom/flyersoft/moonreaderp/PrefMisc;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1374
    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$49;->val$preImmersive:Z

    iput-boolean p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$49;->val$preFullscreen:Z

    iput-boolean p3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$49;->val$preFullscreenWithStatus:Z

    iput p4, p0, Lcom/flyersoft/moonreaderp/PrefMisc$49;->val$preFitCutout:I

    iput-object p5, p0, Lcom/flyersoft/moonreaderp/PrefMisc$49;->val$pref:Lcom/flyersoft/moonreaderp/PrefMisc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1377
    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$49;->val$preImmersive:Z

    sget-boolean p2, Lcom/flyersoft/tools/A;->immersive_fullscreen:Z

    if-ne p1, p2, :cond_0

    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$49;->val$preFullscreen:Z

    sget-boolean p2, Lcom/flyersoft/tools/A;->fullscreen:Z

    if-ne p1, p2, :cond_0

    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$49;->val$preFullscreenWithStatus:Z

    sget-boolean p2, Lcom/flyersoft/tools/A;->fullscreenWithStatus:Z

    if-ne p1, p2, :cond_0

    iget p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$49;->val$preFitCutout:I

    sget p2, Lcom/flyersoft/tools/A;->fitCutout:I

    if-eq p1, p2, :cond_1

    .line 1379
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$49;->val$pref:Lcom/flyersoft/moonreaderp/PrefMisc;

    if-nez p1, :cond_1

    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p1

    if-nez p1, :cond_1

    .line 1380
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->restartReaderIntent()V

    :cond_1
    return-void
.end method
