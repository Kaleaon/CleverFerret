.class Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$3$1;
.super Ljava/lang/Object;
.source "PrefFolderPick.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$3;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$3;

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$3;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 535
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$3$1;->this$2:Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$3;

    iput p2, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$3$1;->val$position:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 538
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$3$1;->this$2:Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$3;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;

    iget p2, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$3$1;->val$position:I

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->-$$Nest$mdeleteBackup(Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;I)V

    return-void
.end method
