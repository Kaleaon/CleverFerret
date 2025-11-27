.class Lcom/flyersoft/moonreaderp/ActivityMain$101$1;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$101;->done(Lcom/flyersoft/tools/BookDb$BookInfo;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$101;

.field final synthetic val$checked:[Z

.field final synthetic val$selected:Lcom/flyersoft/tools/BookDb$BookInfo;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$101;[ZLcom/flyersoft/tools/BookDb$BookInfo;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
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

    .line 9332
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$101$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$101;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$101$1;->val$checked:[Z

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$101$1;->val$selected:Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 9334
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    const/4 p2, 0x0

    .line 9335
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$101$1;->val$checked:[Z

    array-length v1, v0

    if-ge p2, v1, :cond_1

    .line 9336
    aget-boolean v0, v0, p2

    if-eqz v0, :cond_0

    .line 9337
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$101$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$101;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$101;->val$okBooks:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    .line 9338
    :cond_1
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-lez p2, :cond_2

    .line 9339
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$101$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$101;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain$101;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$101$1;->val$selected:Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-static {p2, v0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$maddOkBooksToGroup(Lcom/flyersoft/moonreaderp/ActivityMain;Lcom/flyersoft/tools/BookDb$BookInfo;Ljava/util/ArrayList;)V

    :cond_2
    return-void
.end method
