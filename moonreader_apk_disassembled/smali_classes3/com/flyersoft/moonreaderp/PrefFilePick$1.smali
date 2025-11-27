.class Lcom/flyersoft/moonreaderp/PrefFilePick$1;
.super Ljava/lang/Object;
.source "PrefFilePick.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefFilePick;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/flyersoft/moonreaderp/PrefFilePick$OnGetFile;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefFilePick;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$inputFilename:Ljava/lang/String;

.field final synthetic val$title:Ljava/lang/String;

.field final synthetic val$tv:Lcom/flyersoft/views/EditViewReadOnly;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefFilePick;Landroid/content/Context;Ljava/lang/String;Lcom/flyersoft/views/EditViewReadOnly;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 22
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFilePick$1;->this$0:Lcom/flyersoft/moonreaderp/PrefFilePick;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefFilePick$1;->val$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefFilePick$1;->val$title:Ljava/lang/String;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PrefFilePick$1;->val$tv:Lcom/flyersoft/views/EditViewReadOnly;

    iput-object p5, p0, Lcom/flyersoft/moonreaderp/PrefFilePick$1;->val$inputFilename:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 25
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilePick$1;->val$context:Landroid/content/Context;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefFilePick$1;->val$title:Ljava/lang/String;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefFilePick$1;->this$0:Lcom/flyersoft/moonreaderp/PrefFilePick;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefFilePick;->lastFolder:Ljava/lang/String;

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefFilePick$1$1;

    invoke-direct {v3, p0}, Lcom/flyersoft/moonreaderp/PrefFilePick$1$1;-><init>(Lcom/flyersoft/moonreaderp/PrefFilePick$1;)V

    invoke-direct {p1, v0, v1, v2, v3}, Lcom/flyersoft/moonreaderp/PrefFolderPick;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;)V

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilePick$1;->val$inputFilename:Ljava/lang/String;

    .line 34
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->setInputFile(Ljava/lang/String;)Lcom/flyersoft/moonreaderp/PrefFolderPick;

    move-result-object p1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilePick$1;->this$0:Lcom/flyersoft/moonreaderp/PrefFilePick;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefFilePick;->filter:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->setFilter(Ljava/lang/String;)Lcom/flyersoft/moonreaderp/PrefFolderPick;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->show()V

    return-void
.end method
