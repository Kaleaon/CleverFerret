.class public Lcom/radaee/util/PopupEditAct;
.super Landroid/app/Activity;
.source "PopupEditAct.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/radaee/util/PopupEditAct$ActRetListener;
    }
.end annotation


# static fields
.field public static ms_listener:Lcom/radaee/util/PopupEditAct$ActRetListener;


# instance fields
.field private m_layout:Landroid/widget/RelativeLayout;

.field private m_listener:Lcom/radaee/util/PopupEditAct$ActRetListener;

.field private m_txt:Landroid/widget/EditText;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/radaee/util/PopupEditAct;)Landroid/widget/RelativeLayout;
    .locals 0

    .line 22
    iget-object p0, p0, Lcom/radaee/util/PopupEditAct;->m_layout:Landroid/widget/RelativeLayout;

    return-object p0
.end method

.method static synthetic access$100(Lcom/radaee/util/PopupEditAct;)Landroid/widget/EditText;
    .locals 0

    .line 22
    iget-object p0, p0, Lcom/radaee/util/PopupEditAct;->m_txt:Landroid/widget/EditText;

    return-object p0
.end method

.method private updateAnnot()V
    .locals 2

    .line 120
    iget-object v0, p0, Lcom/radaee/util/PopupEditAct;->m_txt:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 121
    iget-object v1, p0, Lcom/radaee/util/PopupEditAct;->m_listener:Lcom/radaee/util/PopupEditAct$ActRetListener;

    if-eqz v1, :cond_0

    .line 122
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Lcom/radaee/util/PopupEditAct$ActRetListener;->OnEditValue(Ljava/lang/String;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public onBackPressed()V
    .locals 2

    .line 102
    iget-object v0, p0, Lcom/radaee/util/PopupEditAct;->m_txt:Landroid/widget/EditText;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/widget/EditText;->isShown()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 103
    :cond_0
    invoke-direct {p0}, Lcom/radaee/util/PopupEditAct;->updateAnnot()V

    .line 104
    invoke-super {p0}, Landroid/app/Activity;->onBackPressed()V

    const/4 v0, 0x0

    const v1, 0x10a0001

    .line 105
    invoke-virtual {p0, v0, v1}, Lcom/radaee/util/PopupEditAct;->overridePendingTransition(II)V

    :cond_1
    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 36
    sget-object v0, Lcom/radaee/util/PopupEditAct;->ms_listener:Lcom/radaee/util/PopupEditAct$ActRetListener;

    iput-object v0, p0, Lcom/radaee/util/PopupEditAct;->m_listener:Lcom/radaee/util/PopupEditAct$ActRetListener;

    const/4 v0, 0x0

    .line 37
    sput-object v0, Lcom/radaee/util/PopupEditAct;->ms_listener:Lcom/radaee/util/PopupEditAct$ActRetListener;

    .line 38
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    .line 39
    invoke-virtual {p0, p1}, Lcom/radaee/util/PopupEditAct;->requestWindowFeature(I)Z

    const/high16 p1, 0x10a0000

    const v0, 0x10a0001

    .line 40
    invoke-virtual {p0, p1, v0}, Lcom/radaee/util/PopupEditAct;->overridePendingTransition(II)V

    .line 41
    sget p1, Lcom/radaee/viewlib/R$layout;->pop_edit:I

    invoke-virtual {p0, p1}, Lcom/radaee/util/PopupEditAct;->setContentView(I)V

    .line 42
    sget p1, Lcom/radaee/viewlib/R$id;->lay_root:I

    invoke-virtual {p0, p1}, Lcom/radaee/util/PopupEditAct;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/RelativeLayout;

    iput-object p1, p0, Lcom/radaee/util/PopupEditAct;->m_layout:Landroid/widget/RelativeLayout;

    .line 43
    sget p1, Lcom/radaee/viewlib/R$id;->annot_text:I

    invoke-virtual {p0, p1}, Lcom/radaee/util/PopupEditAct;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/radaee/util/PopupEditAct;->m_txt:Landroid/widget/EditText;

    const/4 v0, 0x4

    .line 44
    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setVisibility(I)V

    .line 45
    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 46
    new-instance v0, Lcom/radaee/util/PopupEditAct$1;

    invoke-direct {v0, p0}, Lcom/radaee/util/PopupEditAct$1;-><init>(Lcom/radaee/util/PopupEditAct;)V

    const-wide/16 v1, 0x32

    .line 97
    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 110
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_2

    .line 111
    iget-object p1, p0, Lcom/radaee/util/PopupEditAct;->m_txt:Landroid/widget/EditText;

    const/4 v1, 0x0

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroid/widget/EditText;->isShown()Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    .line 112
    :cond_0
    invoke-direct {p0}, Lcom/radaee/util/PopupEditAct;->updateAnnot()V

    .line 113
    invoke-virtual {p0}, Lcom/radaee/util/PopupEditAct;->finish()V

    const p1, 0x10a0001

    .line 114
    invoke-virtual {p0, v1, p1}, Lcom/radaee/util/PopupEditAct;->overridePendingTransition(II)V

    goto :goto_1

    :cond_1
    :goto_0
    return v1

    :cond_2
    :goto_1
    return v0
.end method
