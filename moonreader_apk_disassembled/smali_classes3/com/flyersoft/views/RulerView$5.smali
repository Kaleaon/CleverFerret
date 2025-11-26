.class Lcom/flyersoft/views/RulerView$5;
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
.field final synthetic val$outerRb:Landroid/widget/RadioButton;


# direct methods
.method constructor <init>(Landroid/widget/RadioButton;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 601
    iput-object p1, p0, Lcom/flyersoft/views/RulerView$5;->val$outerRb:Landroid/widget/RadioButton;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 604
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isPressed()Z

    move-result p1

    if-eqz p1, :cond_0

    xor-int/lit8 p1, p2, 0x1

    .line 605
    sput-boolean p1, Lcom/flyersoft/views/RulerView;->rulerReverse:Z

    .line 606
    iget-object p1, p0, Lcom/flyersoft/views/RulerView$5;->val$outerRb:Landroid/widget/RadioButton;

    sget-boolean p2, Lcom/flyersoft/views/RulerView;->rulerReverse:Z

    invoke-virtual {p1, p2}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 607
    invoke-static {}, Lcom/flyersoft/views/RulerView;->-$$Nest$smhideRulerImageIfNeed()V

    :cond_0
    return-void
.end method
