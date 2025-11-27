.class Lcom/flyersoft/views/CustomSeek$3;
.super Ljava/lang/Object;
.source "CustomSeek.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/views/CustomSeek;->init(IIILjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/views/CustomSeek;

.field final synthetic val$min:I

.field final synthetic val$sufix:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/views/CustomSeek;ILjava/lang/String;)V
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

    .line 156
    iput-object p1, p0, Lcom/flyersoft/views/CustomSeek$3;->this$0:Lcom/flyersoft/views/CustomSeek;

    iput p2, p0, Lcom/flyersoft/views/CustomSeek$3;->val$min:I

    iput-object p3, p0, Lcom/flyersoft/views/CustomSeek$3;->val$sufix:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 0

    .line 167
    iget-object p1, p0, Lcom/flyersoft/views/CustomSeek$3;->this$0:Lcom/flyersoft/views/CustomSeek;

    iget p3, p0, Lcom/flyersoft/views/CustomSeek$3;->val$min:I

    add-int/2addr p3, p2

    iput p3, p1, Lcom/flyersoft/views/CustomSeek;->current:I

    .line 168
    iget-object p1, p0, Lcom/flyersoft/views/CustomSeek$3;->this$0:Lcom/flyersoft/views/CustomSeek;

    invoke-static {p1}, Lcom/flyersoft/views/CustomSeek;->-$$Nest$fgetstep(Lcom/flyersoft/views/CustomSeek;)I

    move-result p1

    const/4 p2, 0x1

    if-le p1, p2, :cond_0

    .line 169
    iget-object p1, p0, Lcom/flyersoft/views/CustomSeek$3;->this$0:Lcom/flyersoft/views/CustomSeek;

    iget p2, p1, Lcom/flyersoft/views/CustomSeek;->current:I

    iget-object p3, p0, Lcom/flyersoft/views/CustomSeek$3;->this$0:Lcom/flyersoft/views/CustomSeek;

    invoke-static {p3}, Lcom/flyersoft/views/CustomSeek;->-$$Nest$fgetstep(Lcom/flyersoft/views/CustomSeek;)I

    move-result p3

    div-int/2addr p2, p3

    iget-object p3, p0, Lcom/flyersoft/views/CustomSeek$3;->this$0:Lcom/flyersoft/views/CustomSeek;

    invoke-static {p3}, Lcom/flyersoft/views/CustomSeek;->-$$Nest$fgetstep(Lcom/flyersoft/views/CustomSeek;)I

    move-result p3

    mul-int p2, p2, p3

    iput p2, p1, Lcom/flyersoft/views/CustomSeek;->current:I

    .line 170
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/views/CustomSeek$3;->this$0:Lcom/flyersoft/views/CustomSeek;

    iget-object p1, p1, Lcom/flyersoft/views/CustomSeek;->valueTv:Landroid/widget/TextView;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, ""

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Lcom/flyersoft/views/CustomSeek$3;->this$0:Lcom/flyersoft/views/CustomSeek;

    iget p3, p3, Lcom/flyersoft/views/CustomSeek;->current:I

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    iget-object p3, p0, Lcom/flyersoft/views/CustomSeek$3;->val$sufix:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 171
    iget-object p1, p0, Lcom/flyersoft/views/CustomSeek$3;->this$0:Lcom/flyersoft/views/CustomSeek;

    iget-object p1, p1, Lcom/flyersoft/views/CustomSeek;->progressChanged:Lcom/flyersoft/views/CustomSeek$OnProgressChanged;

    if-eqz p1, :cond_1

    .line 172
    iget-object p1, p0, Lcom/flyersoft/views/CustomSeek$3;->this$0:Lcom/flyersoft/views/CustomSeek;

    iget-object p1, p1, Lcom/flyersoft/views/CustomSeek;->progressChanged:Lcom/flyersoft/views/CustomSeek$OnProgressChanged;

    iget-object p2, p0, Lcom/flyersoft/views/CustomSeek$3;->this$0:Lcom/flyersoft/views/CustomSeek;

    iget p2, p2, Lcom/flyersoft/views/CustomSeek;->current:I

    invoke-interface {p1, p2}, Lcom/flyersoft/views/CustomSeek$OnProgressChanged;->onValueRecive(I)V

    :cond_1
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method
