.class Lcom/flyersoft/moonreaderp/ActivityMain$93;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->clearGroup(Lcom/flyersoft/tools/BookDb$BookInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Lcom/flyersoft/tools/BookDb$BookInfo;)V
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

    .line 9074
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$93;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$93;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 9077
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$93;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object p1, p1, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 9078
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$93;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/flyersoft/tools/BookDb;->insertBook(Lcom/flyersoft/tools/BookDb$BookInfo;Z)J

    .line 9079
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$93;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateShelf()V

    .line 9080
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$93;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$93;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object p2, p2, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mshelfFocusToBook(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/String;)V

    return-void
.end method
