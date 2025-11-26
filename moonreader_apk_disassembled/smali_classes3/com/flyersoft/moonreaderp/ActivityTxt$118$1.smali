.class Lcom/flyersoft/moonreaderp/ActivityTxt$118$1;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt$118;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$118;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt$118;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 12388
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$118$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$118;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetFolder(Ljava/lang/String;)V
    .locals 2

    .line 12390
    sget-object v0, Lcom/flyersoft/tools/A;->attachment_save_path:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 12391
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$118$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$118;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$118;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->attachmentSavePathChanged:Z

    .line 12392
    sput-object p1, Lcom/flyersoft/tools/A;->attachment_save_path:Ljava/lang/String;

    .line 12394
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$118$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$118;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$118;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mforopenFromUri(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    return-void
.end method
