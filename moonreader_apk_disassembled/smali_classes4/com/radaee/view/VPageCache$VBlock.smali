.class public Lcom/radaee/view/VPageCache$VBlock;
.super Ljava/lang/Object;
.source "VPageCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/view/VPageCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "VBlock"
.end annotation


# instance fields
.field bmp:Landroid/graphics/Bitmap;

.field page:Lcom/radaee/pdf/Page;

.field size:I

.field status:I

.field final synthetic this$0:Lcom/radaee/view/VPageCache;

.field x:I

.field y:I


# direct methods
.method private constructor <init>(Lcom/radaee/view/VPageCache;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 27
    iput-object p1, p0, Lcom/radaee/view/VPageCache$VBlock;->this$0:Lcom/radaee/view/VPageCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/radaee/view/VPageCache;Lcom/radaee/view/VPageCache$1;)V
    .locals 0

    .line 24
    invoke-direct {p0, p1}, Lcom/radaee/view/VPageCache$VBlock;-><init>(Lcom/radaee/view/VPageCache;)V

    return-void
.end method

.method private constructor <init>(Lcom/radaee/view/VPageCache;Lcom/radaee/view/VPageCache$VBlock;)V
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

    .line 30
    iput-object p1, p0, Lcom/radaee/view/VPageCache$VBlock;->this$0:Lcom/radaee/view/VPageCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iget p1, p2, Lcom/radaee/view/VPageCache$VBlock;->x:I

    iput p1, p0, Lcom/radaee/view/VPageCache$VBlock;->x:I

    .line 32
    iget p1, p2, Lcom/radaee/view/VPageCache$VBlock;->y:I

    iput p1, p0, Lcom/radaee/view/VPageCache$VBlock;->y:I

    .line 33
    iget p1, p2, Lcom/radaee/view/VPageCache$VBlock;->size:I

    iput p1, p0, Lcom/radaee/view/VPageCache$VBlock;->size:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/radaee/view/VPageCache;Lcom/radaee/view/VPageCache$VBlock;Lcom/radaee/view/VPageCache$1;)V
    .locals 0

    .line 24
    invoke-direct {p0, p1, p2}, Lcom/radaee/view/VPageCache$VBlock;-><init>(Lcom/radaee/view/VPageCache;Lcom/radaee/view/VPageCache$VBlock;)V

    return-void
.end method

.method private Render(Lcom/radaee/pdf/Document;ILcom/radaee/pdf/Matrix;II)V
    .locals 0

    .line 38
    :try_start_0
    invoke-virtual {p1, p2}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object p1

    iput-object p1, p0, Lcom/radaee/view/VPageCache$VBlock;->page:Lcom/radaee/pdf/Page;

    .line 39
    iget-object p1, p0, Lcom/radaee/view/VPageCache$VBlock;->this$0:Lcom/radaee/view/VPageCache;

    invoke-static {p1}, Lcom/radaee/view/VPageCache;->access$000(Lcom/radaee/view/VPageCache;)Landroid/graphics/Bitmap$Config;

    move-result-object p1

    invoke-static {p4, p5, p1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 40
    iget-object p2, p0, Lcom/radaee/view/VPageCache$VBlock;->page:Lcom/radaee/pdf/Page;

    invoke-virtual {p2, p1}, Lcom/radaee/pdf/Page;->RenderPrepare(Landroid/graphics/Bitmap;)V

    .line 41
    iget-object p2, p0, Lcom/radaee/view/VPageCache$VBlock;->page:Lcom/radaee/pdf/Page;

    invoke-virtual {p2, p1, p3}, Lcom/radaee/pdf/Page;->RenderToBmp(Landroid/graphics/Bitmap;Lcom/radaee/pdf/Matrix;)Z

    .line 42
    iget p2, p0, Lcom/radaee/view/VPageCache$VBlock;->status:I

    const/4 p3, -0x1

    if-eq p2, p3, :cond_0

    const/4 p2, 0x2

    .line 43
    iput p2, p0, Lcom/radaee/view/VPageCache$VBlock;->status:I

    .line 44
    iput-object p1, p0, Lcom/radaee/view/VPageCache$VBlock;->bmp:Landroid/graphics/Bitmap;

    return-void

    .line 46
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    const/4 p1, 0x0

    .line 47
    iput-object p1, p0, Lcom/radaee/view/VPageCache$VBlock;->bmp:Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method


# virtual methods
.method protected final Cancel()V
    .locals 2

    .line 71
    iget v0, p0, Lcom/radaee/view/VPageCache$VBlock;->status:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    .line 73
    iget-object v0, p0, Lcom/radaee/view/VPageCache$VBlock;->page:Lcom/radaee/pdf/Page;

    if-eqz v0, :cond_0

    .line 74
    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->RenderCancel()V

    .line 75
    :cond_0
    iput v1, p0, Lcom/radaee/view/VPageCache$VBlock;->status:I

    :cond_1
    return-void
.end method

.method protected final Draw(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Rect;)Z
    .locals 3

    .line 80
    iget-object v0, p0, Lcom/radaee/view/VPageCache$VBlock;->bmp:Landroid/graphics/Bitmap;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    const/4 v2, 0x0

    .line 82
    invoke-virtual {p1, v0, p2, p3, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    return v1

    .line 87
    :cond_0
    iget-object p2, p0, Lcom/radaee/view/VPageCache$VBlock;->this$0:Lcom/radaee/view/VPageCache;

    invoke-static {p2}, Lcom/radaee/view/VPageCache;->access$600(Lcom/radaee/view/VPageCache;)Landroid/graphics/Paint;

    move-result-object p2

    invoke-virtual {p1, p3, p2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 88
    iget p1, p0, Lcom/radaee/view/VPageCache$VBlock;->status:I

    if-nez p1, :cond_1

    return v1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public GetPageNO()I
    .locals 1

    .line 105
    iget-object v0, p0, Lcom/radaee/view/VPageCache$VBlock;->this$0:Lcom/radaee/view/VPageCache;

    invoke-static {v0}, Lcom/radaee/view/VPageCache;->access$300(Lcom/radaee/view/VPageCache;)I

    move-result v0

    return v0
.end method

.method public final Render()V
    .locals 13

    .line 56
    iget-object v0, p0, Lcom/radaee/view/VPageCache$VBlock;->this$0:Lcom/radaee/view/VPageCache;

    invoke-static {v0}, Lcom/radaee/view/VPageCache;->access$100(Lcom/radaee/view/VPageCache;)I

    move-result v0

    if-nez v0, :cond_0

    .line 58
    new-instance v4, Lcom/radaee/pdf/Matrix;

    iget-object v0, p0, Lcom/radaee/view/VPageCache$VBlock;->this$0:Lcom/radaee/view/VPageCache;

    invoke-static {v0}, Lcom/radaee/view/VPageCache;->access$200(Lcom/radaee/view/VPageCache;)F

    move-result v0

    iget-object v1, p0, Lcom/radaee/view/VPageCache$VBlock;->this$0:Lcom/radaee/view/VPageCache;

    invoke-static {v1}, Lcom/radaee/view/VPageCache;->access$200(Lcom/radaee/view/VPageCache;)F

    move-result v1

    neg-float v1, v1

    iget-object v2, p0, Lcom/radaee/view/VPageCache$VBlock;->this$0:Lcom/radaee/view/VPageCache;

    invoke-static {v2}, Lcom/radaee/view/VPageCache;->access$400(Lcom/radaee/view/VPageCache;)Lcom/radaee/pdf/Document;

    move-result-object v2

    iget-object v3, p0, Lcom/radaee/view/VPageCache$VBlock;->this$0:Lcom/radaee/view/VPageCache;

    invoke-static {v3}, Lcom/radaee/view/VPageCache;->access$300(Lcom/radaee/view/VPageCache;)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v2

    iget-object v3, p0, Lcom/radaee/view/VPageCache$VBlock;->this$0:Lcom/radaee/view/VPageCache;

    invoke-static {v3}, Lcom/radaee/view/VPageCache;->access$200(Lcom/radaee/view/VPageCache;)F

    move-result v3

    mul-float v2, v2, v3

    iget v3, p0, Lcom/radaee/view/VPageCache$VBlock;->y:I

    int-to-float v3, v3

    sub-float/2addr v2, v3

    const/4 v3, 0x0

    invoke-direct {v4, v0, v1, v3, v2}, Lcom/radaee/pdf/Matrix;-><init>(FFFF)V

    .line 59
    iget-object v0, p0, Lcom/radaee/view/VPageCache$VBlock;->this$0:Lcom/radaee/view/VPageCache;

    invoke-static {v0}, Lcom/radaee/view/VPageCache;->access$400(Lcom/radaee/view/VPageCache;)Lcom/radaee/pdf/Document;

    move-result-object v2

    iget-object v0, p0, Lcom/radaee/view/VPageCache$VBlock;->this$0:Lcom/radaee/view/VPageCache;

    invoke-static {v0}, Lcom/radaee/view/VPageCache;->access$300(Lcom/radaee/view/VPageCache;)I

    move-result v3

    iget-object v0, p0, Lcom/radaee/view/VPageCache$VBlock;->this$0:Lcom/radaee/view/VPageCache;

    invoke-static {v0}, Lcom/radaee/view/VPageCache;->access$500(Lcom/radaee/view/VPageCache;)I

    move-result v5

    iget v6, p0, Lcom/radaee/view/VPageCache$VBlock;->size:I

    move-object v1, p0

    invoke-direct/range {v1 .. v6}, Lcom/radaee/view/VPageCache$VBlock;->Render(Lcom/radaee/pdf/Document;ILcom/radaee/pdf/Matrix;II)V

    .line 60
    invoke-virtual {v4}, Lcom/radaee/pdf/Matrix;->Destroy()V

    return-void

    :cond_0
    move-object v1, p0

    .line 64
    new-instance v10, Lcom/radaee/pdf/Matrix;

    iget-object v0, v1, Lcom/radaee/view/VPageCache$VBlock;->this$0:Lcom/radaee/view/VPageCache;

    invoke-static {v0}, Lcom/radaee/view/VPageCache;->access$200(Lcom/radaee/view/VPageCache;)F

    move-result v0

    iget-object v2, v1, Lcom/radaee/view/VPageCache$VBlock;->this$0:Lcom/radaee/view/VPageCache;

    invoke-static {v2}, Lcom/radaee/view/VPageCache;->access$200(Lcom/radaee/view/VPageCache;)F

    move-result v2

    neg-float v2, v2

    iget v3, v1, Lcom/radaee/view/VPageCache$VBlock;->x:I

    neg-int v3, v3

    int-to-float v3, v3

    iget-object v4, v1, Lcom/radaee/view/VPageCache$VBlock;->this$0:Lcom/radaee/view/VPageCache;

    invoke-static {v4}, Lcom/radaee/view/VPageCache;->access$500(Lcom/radaee/view/VPageCache;)I

    move-result v4

    int-to-float v4, v4

    invoke-direct {v10, v0, v2, v3, v4}, Lcom/radaee/pdf/Matrix;-><init>(FFFF)V

    .line 65
    iget-object v0, v1, Lcom/radaee/view/VPageCache$VBlock;->this$0:Lcom/radaee/view/VPageCache;

    invoke-static {v0}, Lcom/radaee/view/VPageCache;->access$400(Lcom/radaee/view/VPageCache;)Lcom/radaee/pdf/Document;

    move-result-object v8

    iget-object v0, v1, Lcom/radaee/view/VPageCache$VBlock;->this$0:Lcom/radaee/view/VPageCache;

    invoke-static {v0}, Lcom/radaee/view/VPageCache;->access$300(Lcom/radaee/view/VPageCache;)I

    move-result v9

    iget v11, v1, Lcom/radaee/view/VPageCache$VBlock;->size:I

    iget-object v0, v1, Lcom/radaee/view/VPageCache$VBlock;->this$0:Lcom/radaee/view/VPageCache;

    invoke-static {v0}, Lcom/radaee/view/VPageCache;->access$500(Lcom/radaee/view/VPageCache;)I

    move-result v12

    move-object v7, v1

    invoke-direct/range {v7 .. v12}, Lcom/radaee/view/VPageCache$VBlock;->Render(Lcom/radaee/pdf/Document;ILcom/radaee/pdf/Matrix;II)V

    .line 66
    invoke-virtual {v10}, Lcom/radaee/pdf/Matrix;->Destroy()V

    return-void
.end method

.method public final Reset()V
    .locals 1

    .line 93
    iget-object v0, p0, Lcom/radaee/view/VPageCache$VBlock;->page:Lcom/radaee/pdf/Page;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->Close()V

    .line 94
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/VPageCache$VBlock;->bmp:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    :cond_1
    const/4 v0, 0x0

    .line 95
    iput-object v0, p0, Lcom/radaee/view/VPageCache$VBlock;->page:Lcom/radaee/pdf/Page;

    .line 96
    iput-object v0, p0, Lcom/radaee/view/VPageCache$VBlock;->bmp:Landroid/graphics/Bitmap;

    return-void
.end method

.method protected finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 101
    invoke-virtual {p0}, Lcom/radaee/view/VPageCache$VBlock;->Reset()V

    .line 102
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method
