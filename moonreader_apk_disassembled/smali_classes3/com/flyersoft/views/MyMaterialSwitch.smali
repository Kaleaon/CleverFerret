.class public Lcom/flyersoft/views/MyMaterialSwitch;
.super Landroid/widget/LinearLayout;
.source "MyMaterialSwitch.java"


# instance fields
.field iv:Landroid/widget/ImageView;

.field mSwitch:Lcom/google/android/material/materialswitch/MaterialSwitch;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 19
    invoke-direct {p0, p1, v0}, Lcom/flyersoft/views/MyMaterialSwitch;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 23
    invoke-direct {p0, p1, p2, v0}, Lcom/flyersoft/views/MyMaterialSwitch;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 27
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 29
    invoke-virtual {p0}, Lcom/flyersoft/views/MyMaterialSwitch;->isInEditMode()Z

    move-result p2

    if-nez p2, :cond_0

    .line 30
    invoke-direct {p0, p1}, Lcom/flyersoft/views/MyMaterialSwitch;->initView(Landroid/content/Context;)V

    :cond_0
    return-void
.end method

.method private initView(Landroid/content/Context;)V
    .locals 3

    .line 38
    new-instance v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-direct {v0, p1}, Lcom/google/android/material/materialswitch/MaterialSwitch;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/flyersoft/views/MyMaterialSwitch;->mSwitch:Lcom/google/android/material/materialswitch/MaterialSwitch;

    .line 39
    new-instance v0, Landroid/widget/ImageView;

    invoke-direct {v0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/flyersoft/views/MyMaterialSwitch;->iv:Landroid/widget/ImageView;

    .line 40
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v0, -0x2

    const/high16 v1, 0x40a00000    # 5.0f

    const/4 v2, -0x1

    invoke-direct {p1, v2, v0, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 41
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v1, 0x42200000    # 40.0f

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    invoke-direct {v0, v2, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v1, 0x10

    .line 42
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    iput v1, p1, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    const/4 v1, 0x0

    .line 43
    invoke-virtual {p0, v1}, Lcom/flyersoft/views/MyMaterialSwitch;->setOrientation(I)V

    .line 44
    iget-object v1, p0, Lcom/flyersoft/views/MyMaterialSwitch;->mSwitch:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {p0, v1, p1}, Lcom/flyersoft/views/MyMaterialSwitch;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 45
    iget-object p1, p0, Lcom/flyersoft/views/MyMaterialSwitch;->iv:Landroid/widget/ImageView;

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/views/MyMaterialSwitch;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method
