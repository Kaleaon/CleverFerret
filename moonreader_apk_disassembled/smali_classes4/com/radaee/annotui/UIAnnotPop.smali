.class public Lcom/radaee/annotui/UIAnnotPop;
.super Landroid/widget/PopupWindow;
.source "UIAnnotPop.java"


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 0

    .line 10
    invoke-direct {p0, p1}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;)V

    return-void
.end method

.method public constructor <init>(Landroid/view/View;II)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;II)V

    return-void
.end method


# virtual methods
.method public findView(I)Landroid/view/View;
    .locals 1

    .line 18
    invoke-virtual {p0}, Lcom/radaee/annotui/UIAnnotPop;->getContentView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public show(Landroid/view/View;II)V
    .locals 1

    const/4 v0, 0x0

    .line 22
    invoke-virtual {p0, p1, v0, p2, p3}, Lcom/radaee/annotui/UIAnnotPop;->showAtLocation(Landroid/view/View;III)V

    return-void
.end method
