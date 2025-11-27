.class Lcom/radaee/annotui/UIAnnotDlgSign$4;
.super Ljava/lang/Object;
.source "UIAnnotDlgSign.java"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/annotui/UIAnnotDlgSign;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/annotui/UIAnnotDlgSign;


# direct methods
.method constructor <init>(Lcom/radaee/annotui/UIAnnotDlgSign;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 135
    iput-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgSign$4;->this$0:Lcom/radaee/annotui/UIAnnotDlgSign;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 143
    sget-boolean p2, Lcom/radaee/pdf/Global;->g_fake_sign:Z

    if-nez p2, :cond_0

    const/16 p2, 0x68

    goto :goto_0

    :cond_0
    const/16 p2, 0x22

    .line 148
    :goto_0
    iget-object p3, p0, Lcom/radaee/annotui/UIAnnotDlgSign$4;->this$0:Lcom/radaee/annotui/UIAnnotDlgSign;

    invoke-virtual {p3}, Lcom/radaee/annotui/UIAnnotDlgSign;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    invoke-virtual {p3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p3

    .line 149
    iget p4, p3, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float p4, p4

    const p5, 0x3f666666    # 0.9f

    mul-float p4, p4, p5

    .line 150
    iget p3, p3, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float p3, p3

    mul-float p3, p3, p5

    .line 151
    iget-object p5, p0, Lcom/radaee/annotui/UIAnnotDlgSign$4;->this$0:Lcom/radaee/annotui/UIAnnotDlgSign;

    invoke-virtual {p5}, Lcom/radaee/annotui/UIAnnotDlgSign;->getContext()Landroid/content/Context;

    move-result-object p5

    int-to-float p2, p2

    invoke-static {p5, p2}, Lcom/radaee/annotui/UIAnnotDlgSign;->dp2px(Landroid/content/Context;F)F

    move-result p2

    .line 152
    iget-object p5, p0, Lcom/radaee/annotui/UIAnnotDlgSign$4;->this$0:Lcom/radaee/annotui/UIAnnotDlgSign;

    iget-object p5, p5, Lcom/radaee/annotui/UIAnnotDlgSign;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p5}, Lcom/radaee/pdf/Page$Annotation;->GetRect()[F

    move-result-object p5

    const/4 p6, 0x2

    .line 153
    aget p6, p5, p6

    const/4 p7, 0x0

    aget p7, p5, p7

    sub-float p8, p6, p7

    div-float/2addr p4, p8

    sub-float/2addr p3, p2

    const/4 p8, 0x3

    .line 154
    aget p8, p5, p8

    const/4 p9, 0x1

    aget p5, p5, p9

    sub-float p9, p8, p5

    div-float/2addr p3, p9

    cmpl-float p9, p4, p3

    if-lez p9, :cond_1

    move p4, p3

    :cond_1
    sub-float/2addr p6, p7

    mul-float p6, p6, p4

    sub-float/2addr p8, p5

    mul-float p8, p8, p4

    .line 160
    new-instance p3, Landroid/widget/FrameLayout$LayoutParams;

    float-to-int p4, p6

    add-float/2addr p8, p2

    float-to-int p2, p8

    invoke-direct {p3, p4, p2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 161
    invoke-virtual {p1, p3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 162
    iget-object p2, p0, Lcom/radaee/annotui/UIAnnotDlgSign$4;->this$0:Lcom/radaee/annotui/UIAnnotDlgSign;

    invoke-virtual {p2, p1}, Lcom/radaee/annotui/UIAnnotDlgSign;->forceWrapContent(Landroid/view/View;)V

    return-void
.end method
