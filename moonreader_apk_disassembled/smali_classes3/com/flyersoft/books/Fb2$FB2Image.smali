.class public Lcom/flyersoft/books/Fb2$FB2Image;
.super Ljava/lang/Object;
.source "Fb2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/books/Fb2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "FB2Image"
.end annotation


# instance fields
.field binary:Ljava/lang/String;

.field len:I

.field start:I

.field final synthetic this$0:Lcom/flyersoft/books/Fb2;

.field title:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/flyersoft/books/Fb2;Ljava/lang/String;Ljava/lang/String;II)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            null,
            null,
            null,
            null,
            null
        }
    .end annotation

    .line 504
    iput-object p1, p0, Lcom/flyersoft/books/Fb2$FB2Image;->this$0:Lcom/flyersoft/books/Fb2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 505
    iput-object p2, p0, Lcom/flyersoft/books/Fb2$FB2Image;->title:Ljava/lang/String;

    .line 506
    invoke-static {p1}, Lcom/flyersoft/books/Fb2;->-$$Nest$fgetcurStreamPos(Lcom/flyersoft/books/Fb2;)I

    const/16 p2, 0x14

    invoke-static {p2}, Lcom/flyersoft/tools/A;->isLowMemory(I)Z

    move-result p2

    if-nez p2, :cond_0

    .line 507
    invoke-static {p1}, Lcom/flyersoft/books/Fb2;->-$$Nest$fgetcontentLoadLen(Lcom/flyersoft/books/Fb2;)I

    move-result p2

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    add-int/2addr p2, v0

    invoke-static {p1, p2}, Lcom/flyersoft/books/Fb2;->-$$Nest$fputcontentLoadLen(Lcom/flyersoft/books/Fb2;I)V

    .line 508
    const-string p1, "&#xd;"

    const-string p2, "\r"

    invoke-virtual {p3, p1, p2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "&#xa;"

    const-string p3, "\n"

    invoke-virtual {p1, p2, p3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/books/Fb2$FB2Image;->binary:Ljava/lang/String;

    goto :goto_0

    .line 510
    :cond_0
    invoke-static {p1}, Lcom/flyersoft/books/Fb2;->-$$Nest$fgetnotLoadImageCount(Lcom/flyersoft/books/Fb2;)I

    move-result p2

    add-int/lit8 p2, p2, 0x1

    invoke-static {p1, p2}, Lcom/flyersoft/books/Fb2;->-$$Nest$fputnotLoadImageCount(Lcom/flyersoft/books/Fb2;I)V

    .line 511
    :goto_0
    iput p4, p0, Lcom/flyersoft/books/Fb2$FB2Image;->start:I

    .line 512
    iput p5, p0, Lcom/flyersoft/books/Fb2$FB2Image;->len:I

    return-void
.end method


# virtual methods
.method public getBinary()Ljava/lang/String;
    .locals 4

    .line 515
    invoke-static {}, Lcom/flyersoft/tools/A;->isLowestMemory()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 516
    iget-object v0, p0, Lcom/flyersoft/books/Fb2$FB2Image;->this$0:Lcom/flyersoft/books/Fb2;

    invoke-virtual {v0}, Lcom/flyersoft/books/Fb2;->clearImageCache()V

    .line 517
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/Fb2$FB2Image;->binary:Ljava/lang/String;

    if-nez v0, :cond_3

    .line 518
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "->image not loaded: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/flyersoft/books/Fb2$FB2Image;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " - "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->saveMemoryLog(Ljava/lang/String;)Ljava/lang/String;

    .line 519
    iget v0, p0, Lcom/flyersoft/books/Fb2$FB2Image;->start:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    iget v0, p0, Lcom/flyersoft/books/Fb2$FB2Image;->len:I

    if-ne v0, v1, :cond_1

    goto :goto_0

    .line 521
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/books/Fb2$FB2Image;->this$0:Lcom/flyersoft/books/Fb2;

    iget-object v1, v0, Lcom/flyersoft/books/Fb2;->fb2_filename:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/flyersoft/books/Fb2;->-$$Nest$mgetInputStream(Lcom/flyersoft/books/Fb2;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    iget v2, p0, Lcom/flyersoft/books/Fb2$FB2Image;->start:I

    iget v3, p0, Lcom/flyersoft/books/Fb2$FB2Image;->len:I

    invoke-static {v0, v1, v2, v3}, Lcom/flyersoft/books/Fb2;->-$$Nest$mgetStringFromInputStream(Lcom/flyersoft/books/Fb2;Ljava/io/InputStream;II)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/Fb2$FB2Image;->binary:Ljava/lang/String;

    .line 522
    const-string v1, "&#xd;"

    const-string v2, "\r"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "&#xa;"

    const-string v2, "\n"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/Fb2$FB2Image;->binary:Ljava/lang/String;

    goto :goto_1

    :cond_2
    :goto_0
    const/4 v0, 0x0

    return-object v0

    .line 529
    :cond_3
    :goto_1
    iget-object v0, p0, Lcom/flyersoft/books/Fb2$FB2Image;->binary:Ljava/lang/String;

    return-object v0
.end method
