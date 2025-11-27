.class Lcom/flyersoft/moonreaderp/PrefMisc$97;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->doAfterRestoreFailed(Landroid/content/Context;Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$cloudType:I


# direct methods
.method constructor <init>(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 2508
    iput p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$97;->val$cloudType:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 2511
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p1

    if-nez p1, :cond_4

    .line 2512
    sget-object p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->selfPref:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    if-eqz p1, :cond_0

    .line 2513
    sget-object p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->selfPref:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->dismiss()V

    .line 2514
    :cond_0
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p1

    if-nez p1, :cond_1

    .line 2515
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->closeOldReader()Z

    .line 2516
    :cond_1
    sget-object p1, Lcom/flyersoft/moonreaderp/PrefMisc;->selfPref:Lcom/flyersoft/moonreaderp/PrefMisc;

    if-eqz p1, :cond_2

    .line 2517
    sget-object p1, Lcom/flyersoft/moonreaderp/PrefMisc;->selfPref:Lcom/flyersoft/moonreaderp/PrefMisc;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefMisc;->dismiss()V

    .line 2518
    :cond_2
    sget-object p1, Lcom/flyersoft/moonreaderp/PrefShelf;->selfPref:Lcom/flyersoft/moonreaderp/PrefShelf;

    if-eqz p1, :cond_3

    .line 2519
    sget-object p1, Lcom/flyersoft/moonreaderp/PrefShelf;->selfPref:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefShelf;->dismiss()V

    .line 2520
    :cond_3
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v0, Lcom/flyersoft/tools/A;->FTP_TAG:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$97;->val$cloudType:I

    invoke-static {v0}, Lcom/flyersoft/components/cloud/Cloud;->getPrefix(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/Backup"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->goToQuickFolderTab(Ljava/lang/String;)V

    :cond_4
    return-void
.end method
