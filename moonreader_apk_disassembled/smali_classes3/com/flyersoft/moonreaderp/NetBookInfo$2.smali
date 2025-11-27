.class Lcom/flyersoft/moonreaderp/NetBookInfo$2;
.super Landroid/os/Handler;
.source "NetBookInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/NetBookInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/NetBookInfo;Landroid/os/Looper;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 186
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$2;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 5

    .line 189
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x64

    if-ne v0, v1, :cond_1

    .line 190
    iget v0, p1, Landroid/os/Message;->arg2:I

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$2;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    invoke-static {v1}, Lcom/flyersoft/moonreaderp/NetBookInfo;->-$$Nest$fgetnotificationId(Lcom/flyersoft/moonreaderp/NetBookInfo;)I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 191
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$2;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    iget v1, p1, Landroid/os/Message;->arg1:I

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/NetBookInfo;->-$$Nest$mshowDownloadProgress(Lcom/flyersoft/moonreaderp/NetBookInfo;I)V

    goto :goto_0

    .line 193
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$2;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/NetBookInfo;->downloadB:Landroid/widget/Button;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->download:I

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    .line 196
    :cond_1
    :goto_0
    iget v0, p1, Landroid/os/Message;->what:I

    if-nez v0, :cond_2

    .line 197
    new-instance v0, Lcom/flyersoft/moonreaderp/NetBookInfo$2$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/NetBookInfo$2$1;-><init>(Lcom/flyersoft/moonreaderp/NetBookInfo$2;)V

    .line 205
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/NetBookInfo$2$1;->start()V

    .line 207
    new-instance v0, Lcom/flyersoft/moonreaderp/NetBookInfo$2$2;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/NetBookInfo$2$2;-><init>(Lcom/flyersoft/moonreaderp/NetBookInfo$2;)V

    .line 219
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/NetBookInfo$2$2;->start()V

    .line 223
    :cond_2
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_4

    .line 224
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$2;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/NetBookInfo;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_4

    .line 225
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$2;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v0, v0, Lcom/flyersoft/opds/OpdsEntry;->cover:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 226
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$2;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/NetBookInfo;->mDrawable1:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_3

    .line 227
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$2;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/NetBookInfo;->bookImage:Lcom/flyersoft/views/ShelfImageView;

    invoke-virtual {v0}, Lcom/flyersoft/views/ShelfImageView;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object v0

    check-cast v0, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$2;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/NetBookInfo;->mDrawable1:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v2}, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;->setPlaceholderImage(Landroid/graphics/drawable/Drawable;)V

    .line 228
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$2;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/NetBookInfo;->bookImage:Lcom/flyersoft/views/ShelfImageView;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$2;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v2, v2, Lcom/flyersoft/opds/OpdsEntry;->cover:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/flyersoft/views/ShelfImageView;->setImageURI(Ljava/lang/String;)V

    .line 229
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$2;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v0, v0, Lcom/flyersoft/opds/OpdsEntry;->username:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 230
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$2;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/NetBookInfo;->bookImage:Lcom/flyersoft/views/ShelfImageView;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$2;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v2, v2, Lcom/flyersoft/opds/OpdsEntry;->cover:Ljava/lang/String;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$2;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v3, v3, Lcom/flyersoft/opds/OpdsEntry;->username:Ljava/lang/String;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$2;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v4, v4, Lcom/flyersoft/opds/OpdsEntry;->password:Ljava/lang/String;

    invoke-virtual {v0, v2, v3, v4, v1}, Lcom/flyersoft/views/ShelfImageView;->downloadUrlImage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 234
    :cond_4
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_5

    .line 235
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$2;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/NetBookInfo;->-$$Nest$mcreateAvailableFormats(Lcom/flyersoft/moonreaderp/NetBookInfo;)V

    .line 237
    :cond_5
    iget p1, p1, Landroid/os/Message;->what:I

    const/4 v0, 0x3

    if-ne p1, v0, :cond_6

    .line 238
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$2;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->progressBar1:I

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/NetBookInfo;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_6
    return-void
.end method
