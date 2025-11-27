.class Lcom/flyersoft/moonreaderp/PrefFolderPick$5;
.super Ljava/lang/Object;
.source "PrefFolderPick.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefFolderPick;->setPath()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

.field final synthetic val$folders:[Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefFolderPick;[Ljava/lang/String;)V
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

    .line 264
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$5;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$5;->val$folders:[Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 267
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$5;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folderSV:Landroid/view/View;

    invoke-static {}, Lcom/flyersoft/moonreaderp/ActivityMain;->pathFolderWidth()I

    move-result v1

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$5;->val$folders:[Ljava/lang/String;

    array-length v2, v2

    mul-int v1, v1, v2

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/View;->scrollTo(II)V

    return-void
.end method
