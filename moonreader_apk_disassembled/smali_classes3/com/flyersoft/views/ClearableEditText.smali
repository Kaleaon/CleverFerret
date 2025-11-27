.class public Lcom/flyersoft/views/ClearableEditText;
.super Landroid/widget/EditText;
.source "ClearableEditText.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;
.implements Landroid/view/View$OnFocusChangeListener;


# instance fields
.field private f:Landroid/view/View$OnFocusChangeListener;

.field private l:Landroid/view/View$OnTouchListener;

.field private xD:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 39
    invoke-direct {p0, p1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 40
    invoke-direct {p0}, Lcom/flyersoft/views/ClearableEditText;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 44
    invoke-direct {p0, p1, p2}, Landroid/widget/EditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 45
    invoke-direct {p0}, Lcom/flyersoft/views/ClearableEditText;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 49
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/EditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 50
    invoke-direct {p0}, Lcom/flyersoft/views/ClearableEditText;->init()V

    return-void
.end method

.method private init()V
    .locals 5

    .line 100
    invoke-virtual {p0}, Lcom/flyersoft/views/ClearableEditText;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x2

    aget-object v0, v0, v1

    iput-object v0, p0, Lcom/flyersoft/views/ClearableEditText;->xD:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_0

    .line 102
    invoke-virtual {p0}, Lcom/flyersoft/views/ClearableEditText;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x108006a

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/views/ClearableEditText;->xD:Landroid/graphics/drawable/Drawable;

    .line 104
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/views/ClearableEditText;->getPaddingRight()I

    move-result v0

    .line 105
    iget-object v1, p0, Lcom/flyersoft/views/ClearableEditText;->xD:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    add-int/2addr v2, v0

    iget-object v3, p0, Lcom/flyersoft/views/ClearableEditText;->xD:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {v1, v0, v4, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 106
    invoke-virtual {p0, v4}, Lcom/flyersoft/views/ClearableEditText;->setClearIconVisible(Z)V

    .line 107
    invoke-super {p0, p0}, Landroid/widget/EditText;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 108
    invoke-super {p0, p0}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 109
    new-instance v0, Lcom/flyersoft/views/ClearableEditText$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/views/ClearableEditText$1;-><init>(Lcom/flyersoft/views/ClearableEditText;)V

    invoke-virtual {p0, v0}, Lcom/flyersoft/views/ClearableEditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    return-void
.end method


# virtual methods
.method public onFocusChange(Landroid/view/View;Z)V
    .locals 1

    if-eqz p2, :cond_0

    .line 90
    invoke-virtual {p0}, Lcom/flyersoft/views/ClearableEditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/CharSequence;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/flyersoft/views/ClearableEditText;->setClearIconVisible(Z)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 92
    invoke-virtual {p0, v0}, Lcom/flyersoft/views/ClearableEditText;->setClearIconVisible(Z)V

    .line 94
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/views/ClearableEditText;->f:Landroid/view/View$OnFocusChangeListener;

    if-eqz v0, :cond_1

    .line 95
    invoke-interface {v0, p1, p2}, Landroid/view/View$OnFocusChangeListener;->onFocusChange(Landroid/view/View;Z)V

    :cond_1
    return-void
.end method

.method public onKeyPreIme(ILandroid/view/KeyEvent;)Z
    .locals 2

    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 129
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 130
    invoke-static {v1}, Lcom/flyersoft/tools/A;->setSystemUiVisibility(Z)V

    .line 132
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/widget/EditText;->onKeyPreIme(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 4

    .line 67
    invoke-virtual {p0}, Lcom/flyersoft/views/ClearableEditText;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x2

    aget-object v0, v0, v1

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 68
    invoke-virtual {p0}, Lcom/flyersoft/views/ClearableEditText;->getPaddingRight()I

    move-result v0

    .line 69
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p0}, Lcom/flyersoft/views/ClearableEditText;->getWidth()I

    move-result v3

    mul-int/lit8 v0, v0, 0x5

    div-int/lit8 v0, v0, 0xa

    sub-int/2addr v3, v0

    iget-object v0, p0, Lcom/flyersoft/views/ClearableEditText;->xD:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    sub-int/2addr v3, v0

    int-to-float v0, v3

    cmpl-float v0, v2, v0

    if-lez v0, :cond_1

    .line 71
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/4 p2, 0x1

    if-ne p1, p2, :cond_0

    .line 72
    const-string p1, ""

    invoke-virtual {p0, p1}, Lcom/flyersoft/views/ClearableEditText;->setText(Ljava/lang/CharSequence;)V

    .line 74
    invoke-virtual {p0}, Lcom/flyersoft/views/ClearableEditText;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "input_method"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/inputmethod/InputMethodManager;

    if-eqz p1, :cond_0

    .line 76
    invoke-virtual {p1, p0, v1}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    :cond_0
    return p2

    .line 82
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/views/ClearableEditText;->l:Landroid/view/View$OnTouchListener;

    if-eqz v0, :cond_2

    .line 83
    invoke-interface {v0, p1, p2}, Landroid/view/View$OnTouchListener;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p1

    return p1

    :cond_2
    return v1
.end method

.method public setClearIconVisible(Z)V
    .locals 4

    if-eqz p1, :cond_0

    .line 122
    iget-object p1, p0, Lcom/flyersoft/views/ClearableEditText;->xD:Landroid/graphics/drawable/Drawable;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 123
    :goto_0
    invoke-virtual {p0}, Lcom/flyersoft/views/ClearableEditText;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    .line 124
    invoke-virtual {p0}, Lcom/flyersoft/views/ClearableEditText;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v1

    const/4 v2, 0x1

    aget-object v1, v1, v2

    invoke-virtual {p0}, Lcom/flyersoft/views/ClearableEditText;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v2

    const/4 v3, 0x3

    aget-object v2, v2, v3

    .line 123
    invoke-virtual {p0, v0, v1, p1, v2}, Lcom/flyersoft/views/ClearableEditText;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V
    .locals 0

    .line 60
    iput-object p1, p0, Lcom/flyersoft/views/ClearableEditText;->f:Landroid/view/View$OnFocusChangeListener;

    return-void
.end method

.method public setOnTouchListener(Landroid/view/View$OnTouchListener;)V
    .locals 0

    .line 55
    iput-object p1, p0, Lcom/flyersoft/views/ClearableEditText;->l:Landroid/view/View$OnTouchListener;

    return-void
.end method
