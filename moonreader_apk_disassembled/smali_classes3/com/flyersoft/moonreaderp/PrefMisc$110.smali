.class Lcom/flyersoft/moonreaderp/PrefMisc$110;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->backupProc(Landroid/app/Dialog;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$selfPref:Landroid/app/Dialog;


# direct methods
.method constructor <init>(Landroid/app/Dialog;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 2963
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$110;->val$selfPref:Landroid/app/Dialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    .line 2966
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$110;->val$selfPref:Landroid/app/Dialog;

    invoke-virtual {p2}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p2

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$110;->val$selfPref:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->backup_to:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/flyersoft/tools/A;->backup_folder:Ljava/lang/String;

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefMisc$110$1;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$110$1;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc$110;)V

    invoke-direct {p1, p2, v0, v1, v2}, Lcom/flyersoft/moonreaderp/PrefFolderPick;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;)V

    .line 2975
    new-instance p2, Lcom/flyersoft/moonreaderp/PrefMisc$110$2;

    invoke-direct {p2, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$110$2;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc$110;)V

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    const/4 p2, 0x1

    .line 2981
    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->setBackupFileOnly(Z)Lcom/flyersoft/moonreaderp/PrefFolderPick;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->show()V

    return-void
.end method
