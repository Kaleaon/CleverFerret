.class Lcom/example2014/components/NumberPicker$3;
.super Ljava/lang/Object;
.source "NumberPicker.java"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


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

    .line 680
    iput-object p1, p0, Lcom/example2014/components/NumberPicker$3;->this$0:Lcom/example2014/components/NumberPicker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFocusChange(Landroid/view/View;Z)V
    .locals 1

    if-eqz p2, :cond_0

    .line 683
    iget-object p1, p0, Lcom/example2014/components/NumberPicker$3;->this$0:Lcom/example2014/components/NumberPicker;

    iget-object p1, p1, Lcom/example2014/components/NumberPicker;->mInputText:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->selectAll()V

    return-void

    .line 685
    :cond_0
    iget-object p2, p0, Lcom/example2014/components/NumberPicker$3;->this$0:Lcom/example2014/components/NumberPicker;

    iget-object p2, p2, Lcom/example2014/components/NumberPicker;->mInputText:Landroid/widget/EditText;

    const/4 v0, 0x0

    invoke-virtual {p2, v0, v0}, Landroid/widget/EditText;->setSelection(II)V

    .line 686
    iget-object p2, p0, Lcom/example2014/components/NumberPicker$3;->this$0:Lcom/example2014/components/NumberPicker;

    invoke-static {p2, p1}, Lcom/example2014/components/NumberPicker;->access$300(Lcom/example2014/components/NumberPicker;Landroid/view/View;)V

    return-void
.end method
