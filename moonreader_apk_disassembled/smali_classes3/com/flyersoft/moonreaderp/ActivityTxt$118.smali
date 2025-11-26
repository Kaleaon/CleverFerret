.class Lcom/flyersoft/moonreaderp/ActivityTxt$118;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->foropenFromUri()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 12384
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$118;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    .line 12387
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$118;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v0, Lcom/flyersoft/moonreaderp/R$array;->shelf_sort_by:I

    const/4 v1, 0x3

    invoke-static {p2, v0, v1}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/flyersoft/tools/A;->attachment_save_path:Ljava/lang/String;

    new-instance v2, Lcom/flyersoft/moonreaderp/ActivityTxt$118$1;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/ActivityTxt$118$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityTxt$118;)V

    invoke-direct {p1, p2, v0, v1, v2}, Lcom/flyersoft/moonreaderp/PrefFolderPick;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;)V

    .line 12396
    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->show()V

    return-void
.end method
