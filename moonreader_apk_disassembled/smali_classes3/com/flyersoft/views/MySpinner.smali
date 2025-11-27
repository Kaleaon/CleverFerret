.class public Lcom/flyersoft/views/MySpinner;
.super Landroid/widget/Spinner;
.source "MySpinner.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 18
    invoke-direct {p0, p1}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 0

    .line 22
    invoke-direct {p0, p1, p2}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 26
    invoke-direct {p0, p1, p2}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic setAdapter(Landroid/widget/Adapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            null
        }
    .end annotation

    .line 15
    check-cast p1, Landroid/widget/SpinnerAdapter;

    invoke-virtual {p0, p1}, Lcom/flyersoft/views/MySpinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    return-void
.end method

.method public setAdapter(Landroid/widget/SpinnerAdapter;)V
    .locals 3

    .line 31
    invoke-virtual {p0}, Lcom/flyersoft/views/MySpinner;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_2

    .line 32
    invoke-virtual {p0}, Lcom/flyersoft/views/MySpinner;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/components/MyMenu;->getMenuBackground(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/flyersoft/views/MySpinner;->setPopupBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 33
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 34
    invoke-virtual {p0}, Lcom/flyersoft/views/MySpinner;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const v1, -0x44111112

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    :cond_0
    if-eqz p1, :cond_2

    .line 35
    instance-of v0, p1, Landroid/widget/ArrayAdapter;

    if-eqz v0, :cond_2

    .line 36
    move-object v0, p1

    check-cast v0, Landroid/widget/ArrayAdapter;

    .line 37
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v1

    if-eqz v1, :cond_1

    sget v1, Lcom/flyersoft/moonreaderp/R$layout;->spinner_dropdown_item_night:I

    goto :goto_0

    :cond_1
    const v1, 0x1090009

    .line 36
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 39
    :cond_2
    invoke-super {p0, p1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    return-void
.end method
