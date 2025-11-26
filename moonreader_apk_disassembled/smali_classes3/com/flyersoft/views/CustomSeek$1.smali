.class Lcom/flyersoft/views/CustomSeek$1;
.super Ljava/lang/Object;
.source "CustomSeek.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/views/CustomSeek;->initView(Landroid/content/Context;Landroid/util/AttributeSet;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/views/CustomSeek;


# direct methods
.method constructor <init>(Lcom/flyersoft/views/CustomSeek;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 47
    iput-object p1, p0, Lcom/flyersoft/views/CustomSeek$1;->this$0:Lcom/flyersoft/views/CustomSeek;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 50
    iget-object p1, p0, Lcom/flyersoft/views/CustomSeek$1;->this$0:Lcom/flyersoft/views/CustomSeek;

    iget-object p1, p1, Lcom/flyersoft/views/CustomSeek;->seek:Landroid/widget/SeekBar;

    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result p1

    iget-object v0, p0, Lcom/flyersoft/views/CustomSeek$1;->this$0:Lcom/flyersoft/views/CustomSeek;

    invoke-static {v0}, Lcom/flyersoft/views/CustomSeek;->-$$Nest$fgetstep(Lcom/flyersoft/views/CustomSeek;)I

    move-result v0

    add-int/2addr p1, v0

    .line 51
    iget-object v0, p0, Lcom/flyersoft/views/CustomSeek$1;->this$0:Lcom/flyersoft/views/CustomSeek;

    iget v0, v0, Lcom/flyersoft/views/CustomSeek;->distance:I

    if-le p1, v0, :cond_0

    .line 52
    iget-object p1, p0, Lcom/flyersoft/views/CustomSeek$1;->this$0:Lcom/flyersoft/views/CustomSeek;

    iget p1, p1, Lcom/flyersoft/views/CustomSeek;->distance:I

    .line 53
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/views/CustomSeek$1;->this$0:Lcom/flyersoft/views/CustomSeek;

    iget-object v0, v0, Lcom/flyersoft/views/CustomSeek;->seek:Landroid/widget/SeekBar;

    invoke-virtual {v0, p1}, Landroid/widget/SeekBar;->setProgress(I)V

    return-void
.end method
