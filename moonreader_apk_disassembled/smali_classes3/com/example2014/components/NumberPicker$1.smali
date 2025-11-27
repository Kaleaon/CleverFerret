.class Lcom/example2014/components/NumberPicker$1;
.super Ljava/lang/Object;
.source "NumberPicker.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example2014/components/NumberPicker;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/example2014/components/NumberPicker;


# direct methods
.method constructor <init>(Lcom/example2014/components/NumberPicker;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 635
    iput-object p1, p0, Lcom/example2014/components/NumberPicker$1;->this$0:Lcom/example2014/components/NumberPicker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 637
    iget-object v0, p0, Lcom/example2014/components/NumberPicker$1;->this$0:Lcom/example2014/components/NumberPicker;

    invoke-static {v0}, Lcom/example2014/components/NumberPicker;->access$000(Lcom/example2014/components/NumberPicker;)V

    .line 638
    iget-object v0, p0, Lcom/example2014/components/NumberPicker$1;->this$0:Lcom/example2014/components/NumberPicker;

    iget-object v0, v0, Lcom/example2014/components/NumberPicker;->mInputText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->clearFocus()V

    .line 639
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    sget v0, Lcom/example2014/numberpicker/R$id;->np__increment:I

    if-ne p1, v0, :cond_0

    .line 640
    iget-object p1, p0, Lcom/example2014/components/NumberPicker$1;->this$0:Lcom/example2014/components/NumberPicker;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/example2014/components/NumberPicker;->access$100(Lcom/example2014/components/NumberPicker;Z)V

    return-void

    .line 642
    :cond_0
    iget-object p1, p0, Lcom/example2014/components/NumberPicker$1;->this$0:Lcom/example2014/components/NumberPicker;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/example2014/components/NumberPicker;->access$100(Lcom/example2014/components/NumberPicker;Z)V

    return-void
.end method
