.class public Lcom/radaee/reader/PDFMenu;
.super Ljava/lang/Object;
.source "PDFMenu.java"

# interfaces
.implements Landroid/widget/PopupWindow$OnDismissListener;


# instance fields
.field private m_parent:Landroid/view/View;

.field private m_popup:Landroid/widget/PopupWindow;

.field private m_view:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/widget/RelativeLayout;III)V
    .locals 2

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, Lcom/radaee/reader/PDFMenu;->m_popup:Landroid/widget/PopupWindow;

    .line 12
    iput-object v0, p0, Lcom/radaee/reader/PDFMenu;->m_parent:Landroid/view/View;

    .line 13
    iput-object v0, p0, Lcom/radaee/reader/PDFMenu;->m_view:Landroid/view/View;

    .line 16
    invoke-virtual {p1}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    invoke-virtual {v1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/radaee/reader/PDFMenu;->m_view:Landroid/view/View;

    .line 17
    new-instance p2, Landroid/widget/PopupWindow;

    iget-object v0, p0, Lcom/radaee/reader/PDFMenu;->m_view:Landroid/view/View;

    invoke-direct {p2, v0}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;)V

    iput-object p2, p0, Lcom/radaee/reader/PDFMenu;->m_popup:Landroid/widget/PopupWindow;

    .line 18
    invoke-virtual {p2, p0}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 19
    iget-object p2, p0, Lcom/radaee/reader/PDFMenu;->m_popup:Landroid/widget/PopupWindow;

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    .line 20
    iget-object p2, p0, Lcom/radaee/reader/PDFMenu;->m_popup:Landroid/widget/PopupWindow;

    const/4 v1, 0x1

    invoke-virtual {p2, v1}, Landroid/widget/PopupWindow;->setTouchable(Z)V

    .line 21
    iget-object p2, p0, Lcom/radaee/reader/PDFMenu;->m_popup:Landroid/widget/PopupWindow;

    invoke-virtual {p2, v1}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 22
    iget-object p2, p0, Lcom/radaee/reader/PDFMenu;->m_popup:Landroid/widget/PopupWindow;

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v1, v0}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p2, v1}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 23
    invoke-virtual {p1}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p2

    iget p2, p2, Landroid/util/DisplayMetrics;->density:F

    .line 24
    iget-object v0, p0, Lcom/radaee/reader/PDFMenu;->m_popup:Landroid/widget/PopupWindow;

    int-to-float p3, p3

    mul-float p3, p3, p2

    float-to-int p3, p3

    invoke-virtual {v0, p3}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 25
    iget-object p3, p0, Lcom/radaee/reader/PDFMenu;->m_popup:Landroid/widget/PopupWindow;

    int-to-float p4, p4

    mul-float p4, p4, p2

    float-to-int p2, p4

    invoke-virtual {p3, p2}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 26
    iput-object p1, p0, Lcom/radaee/reader/PDFMenu;->m_parent:Landroid/view/View;

    return-void
.end method


# virtual methods
.method final MenuDismiss()V
    .locals 1

    .line 43
    iget-object v0, p0, Lcom/radaee/reader/PDFMenu;->m_popup:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    return-void
.end method

.method final MenuGetView()Landroid/view/View;
    .locals 1

    .line 30
    iget-object v0, p0, Lcom/radaee/reader/PDFMenu;->m_view:Landroid/view/View;

    return-object v0
.end method

.method final MenuShow(II)V
    .locals 5

    const/4 v0, 0x2

    .line 35
    :try_start_0
    new-array v0, v0, [I

    .line 36
    iget-object v1, p0, Lcom/radaee/reader/PDFMenu;->m_parent:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->getLocationInWindow([I)V

    .line 37
    iget-object v1, p0, Lcom/radaee/reader/PDFMenu;->m_popup:Landroid/widget/PopupWindow;

    iget-object v2, p0, Lcom/radaee/reader/PDFMenu;->m_parent:Landroid/view/View;

    const/4 v3, 0x0

    aget v4, v0, v3

    add-int/2addr p1, v4

    const/4 v4, 0x1

    aget v0, v0, v4

    add-int/2addr p2, v0

    invoke-virtual {v1, v2, v3, p1, p2}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method getWidth()I
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/radaee/reader/PDFMenu;->m_popup:Landroid/widget/PopupWindow;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getWidth()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public onDismiss()V
    .locals 0

    return-void
.end method
