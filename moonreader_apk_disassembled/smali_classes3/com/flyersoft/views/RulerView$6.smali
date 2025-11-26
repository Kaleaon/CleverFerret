.class Lcom/flyersoft/views/RulerView$6;
.super Ljava/lang/Object;
.source "RulerView.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/views/RulerView;->showRulerOptions(Landroid/content/Context;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$innerRb:Landroid/widget/RadioButton;


# direct methods
.method constructor <init>(Landroid/widget/RadioButton;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 611
    iput-object p1, p0, Lcom/flyersoft/views/RulerView$6;->val$innerRb:Landroid/widget/RadioButton;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .line 614
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isPressed()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 615
    sput-boolean p2, Lcom/flyersoft/views/RulerView;->rulerReverse:Z

    .line 616
    iget-object p1, p0, Lcom/flyersoft/views/RulerView$6;->val$innerRb:Landroid/widget/RadioButton;

    sget-boolean v0, Lcom/flyersoft/views/RulerView;->rulerReverse:Z

    xor-int/lit8 v0, v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/RadioButton;->setChecked(Z)V

    if-eqz p2, :cond_0

    const/4 p1, 0x0

    .line 618
    sput p1, Lcom/flyersoft/views/RulerView;->rulerLeft:I

    .line 619
    :cond_0
    invoke-static {}, Lcom/flyersoft/views/RulerView;->-$$Nest$smhideRulerImageIfNeed()V

    :cond_1
    return-void
.end method
