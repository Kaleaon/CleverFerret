.class Lcom/flyersoft/moonreaderp/PrefMisc$91;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Lcom/flyersoft/components/cloud/Cloud$OnGetBackupList;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->restoreProc(Landroid/app/Dialog;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$fromWhich:I

.field final synthetic val$selfPref:Landroid/app/Dialog;


# direct methods
.method constructor <init>(Landroid/app/Dialog;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 2337
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$91;->val$selfPref:Landroid/app/Dialog;

    iput p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$91;->val$fromWhich:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public done(Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    if-eqz p2, :cond_0

    .line 2341
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$91;->val$selfPref:Landroid/app/Dialog;

    invoke-virtual {p1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p1

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->error:I

    invoke-static {v0}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0, p2}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    return-void

    :cond_0
    if-eqz p1, :cond_1

    .line 2343
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$91;->val$selfPref:Landroid/app/Dialog;

    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$91;->val$fromWhich:I

    invoke-static {p2, v0, p1}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$smrestoreProc_second(Landroid/app/Dialog;ILjava/util/ArrayList;)V

    :cond_1
    return-void
.end method
