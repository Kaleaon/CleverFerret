.class Lcom/flyersoft/moonreaderp/PrefMisc$124;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->showShelfOptions(Landroid/content/Context;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$con:Landroid/content/Context;

.field final synthetic val$coverWithProgress:Z

.field final synthetic val$languageID:I

.field final synthetic val$woody:Z

.field final synthetic val$woodyResDay:I

.field final synthetic val$woodyResNight:I


# direct methods
.method constructor <init>(ILandroid/content/Context;ZIIZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 3474
    iput p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$124;->val$languageID:I

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$124;->val$con:Landroid/content/Context;

    iput-boolean p3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$124;->val$woody:Z

    iput p4, p0, Lcom/flyersoft/moonreaderp/PrefMisc$124;->val$woodyResDay:I

    iput p5, p0, Lcom/flyersoft/moonreaderp/PrefMisc$124;->val$woodyResNight:I

    iput-boolean p6, p0, Lcom/flyersoft/moonreaderp/PrefMisc$124;->val$coverWithProgress:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 2

    .line 3476
    iget p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$124;->val$languageID:I

    sget v0, Lcom/flyersoft/tools/A;->languageID:I

    if-eq p1, v0, :cond_0

    .line 3477
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$124;->val$con:Landroid/content/Context;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->SaveOptions(Landroid/content/Context;)V

    const/4 p1, 0x0

    .line 3478
    invoke-static {p1}, Ljava/lang/System;->exit(I)V

    return-void

    .line 3482
    :cond_0
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    .line 3484
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 3485
    sget-boolean v0, Lcom/flyersoft/tools/A;->woodyChanged:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$124;->val$woody:Z

    sget-boolean v1, Lcom/flyersoft/tools/A;->woody:Z

    if-ne v0, v1, :cond_1

    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$124;->val$woodyResDay:I

    sget v1, Lcom/flyersoft/tools/A;->woodyResDay:I

    if-ne v0, v1, :cond_1

    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$124;->val$woodyResNight:I

    sget v1, Lcom/flyersoft/tools/A;->woodyResNight:I

    if-eq v0, v1, :cond_3

    .line 3486
    :cond_1
    sget-boolean v0, Lcom/flyersoft/tools/A;->woody:Z

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    .line 3487
    sput v0, Lcom/flyersoft/tools/A;->shelfStyle:I

    .line 3488
    :cond_2
    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateShelf()V

    .line 3490
    :cond_3
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$124;->val$coverWithProgress:Z

    sget-boolean v1, Lcom/flyersoft/tools/A;->coverWithProgress:Z

    if-eq v0, v1, :cond_4

    .line 3491
    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateCoverProgress()V

    :cond_4
    return-void
.end method
