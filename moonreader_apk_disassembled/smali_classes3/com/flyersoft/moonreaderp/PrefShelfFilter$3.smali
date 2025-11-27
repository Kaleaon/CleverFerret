.class Lcom/flyersoft/moonreaderp/PrefShelfFilter$3;
.super Ljava/lang/Object;
.source "PrefShelfFilter.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefShelfFilter;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefShelfFilter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefShelfFilter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 143
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter$3;->this$0:Lcom/flyersoft/moonreaderp/PrefShelfFilter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2

    .line 145
    sput-boolean p2, Lcom/flyersoft/tools/A;->filterAll:Z

    if-nez p2, :cond_0

    .line 147
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter$3;->this$0:Lcom/flyersoft/moonreaderp/PrefShelfFilter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->moreLay:Landroid/view/View;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 148
    new-instance p1, Landroid/view/animation/AlphaAnimation;

    const p2, 0x3dcccccd    # 0.1f

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-direct {p1, p2, v0}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    const-wide/16 v0, 0x1f4

    .line 149
    invoke-virtual {p1, v0, v1}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 150
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter$3;->this$0:Lcom/flyersoft/moonreaderp/PrefShelfFilter;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->moreLay:Landroid/view/View;

    invoke-virtual {p2, p1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_0

    .line 152
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter$3;->this$0:Lcom/flyersoft/moonreaderp/PrefShelfFilter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->moreLay:Landroid/view/View;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 153
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter$3;->this$0:Lcom/flyersoft/moonreaderp/PrefShelfFilter;

    sget-boolean p2, Lcom/flyersoft/tools/A;->filterAll:Z

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->-$$Nest$mupdateBookType(Lcom/flyersoft/moonreaderp/PrefShelfFilter;Z)V

    return-void
.end method
