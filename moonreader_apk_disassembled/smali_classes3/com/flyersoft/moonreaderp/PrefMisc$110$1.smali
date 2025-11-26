.class Lcom/flyersoft/moonreaderp/PrefMisc$110$1;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc$110;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefMisc$110;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefMisc$110;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 2967
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$110$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$110;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetFolder(Ljava/lang/String;)V
    .locals 1

    .line 2969
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2970
    sget-object p1, Lcom/flyersoft/tools/A;->backup_folder:Ljava/lang/String;

    .line 2971
    :cond_0
    sput-object p1, Lcom/flyersoft/tools/A;->backup_folder:Ljava/lang/String;

    .line 2972
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$110$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$110;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefMisc$110;->val$selfPref:Landroid/app/Dialog;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$smbackupProc(Landroid/app/Dialog;I)V

    return-void
.end method
