.class public Lcom/flyersoft/moonreaderp/ClickTip;
.super Lcom/flyersoft/moonreaderp/MyActionBarActivity;
.source "ClickTip.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/moonreaderp/ClickTip$GalleryAdapter;
    }
.end annotation


# static fields
.field public static drawable:Landroid/graphics/drawable/Drawable;

.field public static tips:[I


# instance fields
.field baseLay:Landroid/view/View;

.field bookmarkTv:Landroid/widget/TextView;

.field closeB:Landroid/view/View;

.field gallery:Landroid/widget/Gallery;

.field hideModeZone:Z

.field middle:Landroid/widget/TextView;

.field pageDown1:Landroid/widget/TextView;

.field pageDown2:Landroid/widget/TextView;

.field pageUp1:Landroid/widget/TextView;

.field pageUp2:Landroid/widget/TextView;

.field pageUpTL:Landroid/widget/TextView;

.field pageUpTR:Landroid/widget/TextView;

.field tipLay:Landroid/view/View;


# direct methods
.method static bridge synthetic -$$Nest$minitParams(Lcom/flyersoft/moonreaderp/ClickTip;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/ClickTip;->initParams()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 11

    .line 203
    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->tip11:I

    sget v1, Lcom/flyersoft/moonreaderp/R$drawable;->tip12:I

    sget v2, Lcom/flyersoft/moonreaderp/R$drawable;->tip21:I

    sget v3, Lcom/flyersoft/moonreaderp/R$drawable;->tip22:I

    sget v4, Lcom/flyersoft/moonreaderp/R$drawable;->tip31:I

    sget v5, Lcom/flyersoft/moonreaderp/R$drawable;->tip32:I

    sget v6, Lcom/flyersoft/moonreaderp/R$drawable;->tip41:I

    sget v7, Lcom/flyersoft/moonreaderp/R$drawable;->tip42:I

    sget v8, Lcom/flyersoft/moonreaderp/R$drawable;->tip51:I

    sget v9, Lcom/flyersoft/moonreaderp/R$drawable;->tip52:I

    sget v10, Lcom/flyersoft/moonreaderp/R$drawable;->tip53:I

    filled-new-array/range {v0 .. v10}, [I

    move-result-object v0

    sput-object v0, Lcom/flyersoft/moonreaderp/ClickTip;->tips:[I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/MyActionBarActivity;-><init>()V

    return-void
.end method

.method private getSpinnerText(I)Ljava/lang/CharSequence;
    .locals 1

    .line 170
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefControl;->selfPref:Lcom/flyersoft/moonreaderp/PrefControl;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefControl;->root:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Spinner;

    .line 171
    invoke-virtual {p1}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public static getTipId()I
    .locals 1

    .line 157
    sget v0, Lcom/flyersoft/tools/A;->tapMode:I

    packed-switch v0, :pswitch_data_0

    const/4 v0, 0x1

    return v0

    :pswitch_0
    const/16 v0, 0xa

    return v0

    :pswitch_1
    const/16 v0, 0x9

    return v0

    :pswitch_2
    const/16 v0, 0x8

    return v0

    .line 161
    :pswitch_3
    sget-boolean v0, Lcom/flyersoft/tools/A;->toggleTapMode:Z

    if-nez v0, :cond_0

    const/4 v0, 0x6

    return v0

    :cond_0
    const/4 v0, 0x7

    return v0

    .line 160
    :pswitch_4
    sget-boolean v0, Lcom/flyersoft/tools/A;->toggleTapMode:Z

    if-nez v0, :cond_1

    const/4 v0, 0x4

    return v0

    :cond_1
    const/4 v0, 0x5

    return v0

    .line 159
    :pswitch_5
    sget-boolean v0, Lcom/flyersoft/tools/A;->toggleTapMode:Z

    if-nez v0, :cond_2

    const/4 v0, 0x2

    return v0

    :cond_2
    const/4 v0, 0x3

    return v0

    .line 158
    :pswitch_6
    sget-boolean v0, Lcom/flyersoft/tools/A;->toggleTapMode:Z

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private initGallery()V
    .locals 2

    .line 176
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->gallery1:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/ClickTip;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Gallery;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->gallery:Landroid/widget/Gallery;

    .line 177
    iget-boolean v1, p0, Lcom/flyersoft/moonreaderp/ClickTip;->hideModeZone:Z

    if-eqz v1, :cond_0

    const/16 v1, 0x8

    .line 178
    invoke-virtual {v0, v1}, Landroid/widget/Gallery;->setVisibility(I)V

    .line 179
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->bookmarkTv:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 180
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->bookmarkTv:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    return-void

    .line 184
    :cond_0
    new-instance v1, Lcom/flyersoft/moonreaderp/ClickTip$GalleryAdapter;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/ClickTip$GalleryAdapter;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/widget/Gallery;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 185
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->gallery:Landroid/widget/Gallery;

    invoke-static {}, Lcom/flyersoft/moonreaderp/ClickTip;->getTipId()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Gallery;->setSelection(I)V

    .line 186
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->gallery:Landroid/widget/Gallery;

    new-instance v1, Lcom/flyersoft/moonreaderp/ClickTip$3;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/ClickTip$3;-><init>(Lcom/flyersoft/moonreaderp/ClickTip;)V

    invoke-virtual {v0, v1}, Landroid/widget/Gallery;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    return-void
.end method

.method private initParams()V
    .locals 5

    .line 96
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_0

    .line 97
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageUp1:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    sget v1, Lcom/flyersoft/tools/C;->colorPrimary:I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 98
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageUp2:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    sget v1, Lcom/flyersoft/tools/C;->colorPrimary:I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 99
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageUpTL:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    sget v1, Lcom/flyersoft/tools/C;->colorPrimary:I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 100
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageUpTR:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    sget v1, Lcom/flyersoft/tools/C;->colorPrimary:I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 101
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->middle:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    sget v1, Lcom/flyersoft/tools/C;->colorPrimary:I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 102
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageDown1:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    sget v1, Lcom/flyersoft/tools/C;->colorPrimary:I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 103
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageDown2:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    sget v1, Lcom/flyersoft/tools/C;->colorPrimary:I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 104
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->bookmarkTv:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    sget v1, Lcom/flyersoft/tools/C;->colorPrimary:I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 107
    :cond_0
    sget-boolean v0, Lcom/flyersoft/tools/A;->isTablet:Z

    if-eqz v0, :cond_1

    .line 110
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageUp1:Landroid/widget/TextView;

    const/16 v1, 0x18

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 111
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageUp2:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 112
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageDown1:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 113
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageDown2:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 114
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->middle:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 115
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageUp1:Landroid/widget/TextView;

    const/16 v1, 0xe

    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 116
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageUp2:Landroid/widget/TextView;

    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 117
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageDown1:Landroid/widget/TextView;

    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 118
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageDown2:Landroid/widget/TextView;

    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 119
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->middle:Landroid/widget/TextView;

    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 121
    :cond_1
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefControl;->selfPref:Lcom/flyersoft/moonreaderp/PrefControl;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 122
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageUp1:Landroid/widget/TextView;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pcTapTop:I

    invoke-direct {p0, v2}, Lcom/flyersoft/moonreaderp/ClickTip;->getSpinnerText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 123
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageUpTL:Landroid/widget/TextView;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pcTapTop:I

    invoke-direct {p0, v2}, Lcom/flyersoft/moonreaderp/ClickTip;->getSpinnerText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageUpTR:Landroid/widget/TextView;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pcTapTop:I

    invoke-direct {p0, v2}, Lcom/flyersoft/moonreaderp/ClickTip;->getSpinnerText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 125
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageUp2:Landroid/widget/TextView;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pcTapLeft:I

    invoke-direct {p0, v2}, Lcom/flyersoft/moonreaderp/ClickTip;->getSpinnerText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 126
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageDown1:Landroid/widget/TextView;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pcTapBottom:I

    invoke-direct {p0, v2}, Lcom/flyersoft/moonreaderp/ClickTip;->getSpinnerText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 127
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageDown2:Landroid/widget/TextView;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pcTapRight:I

    invoke-direct {p0, v2}, Lcom/flyersoft/moonreaderp/ClickTip;->getSpinnerText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 129
    :cond_2
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ClickTip;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v2, Lcom/flyersoft/moonreaderp/R$array;->controls:I

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    .line 130
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageUp1:Landroid/widget/TextView;

    aget-object v3, v0, v1

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 131
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageUp2:Landroid/widget/TextView;

    aget-object v3, v0, v1

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 132
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageUpTL:Landroid/widget/TextView;

    aget-object v3, v0, v1

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 133
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageUpTR:Landroid/widget/TextView;

    aget-object v3, v0, v1

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 134
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageDown1:Landroid/widget/TextView;

    const/4 v3, 0x1

    aget-object v4, v0, v3

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 135
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageDown2:Landroid/widget/TextView;

    aget-object v0, v0, v3

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 137
    :goto_0
    sget v0, Lcom/flyersoft/tools/A;->tapMode:I

    const/4 v2, 0x4

    const/16 v3, 0x8

    if-ge v0, v2, :cond_7

    .line 138
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageUp1:Landroid/widget/TextView;

    sget-boolean v2, Lcom/flyersoft/tools/A;->toggleTapMode:Z

    if-eqz v2, :cond_3

    const/16 v2, 0x8

    goto :goto_1

    :cond_3
    const/4 v2, 0x0

    :goto_1
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 139
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageUp2:Landroid/widget/TextView;

    sget-boolean v2, Lcom/flyersoft/tools/A;->toggleTapMode:Z

    if-nez v2, :cond_4

    const/16 v2, 0x8

    goto :goto_2

    :cond_4
    const/4 v2, 0x0

    :goto_2
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 140
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageDown1:Landroid/widget/TextView;

    sget-boolean v2, Lcom/flyersoft/tools/A;->toggleTapMode:Z

    if-eqz v2, :cond_5

    const/16 v2, 0x8

    goto :goto_3

    :cond_5
    const/4 v2, 0x0

    :goto_3
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 141
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageDown2:Landroid/widget/TextView;

    sget-boolean v2, Lcom/flyersoft/tools/A;->toggleTapMode:Z

    if-nez v2, :cond_6

    const/16 v1, 0x8

    :cond_6
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 142
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageUpTL:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 143
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageUpTR:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_7

    .line 145
    :cond_7
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageUpTL:Landroid/widget/TextView;

    sget v4, Lcom/flyersoft/tools/A;->tapMode:I

    if-ne v4, v2, :cond_8

    const/4 v2, 0x0

    goto :goto_4

    :cond_8
    const/16 v2, 0x8

    :goto_4
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 146
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageUp1:Landroid/widget/TextView;

    sget v2, Lcom/flyersoft/tools/A;->tapMode:I

    const/4 v4, 0x5

    if-ne v2, v4, :cond_9

    const/4 v2, 0x0

    goto :goto_5

    :cond_9
    const/16 v2, 0x8

    :goto_5
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 147
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageUpTR:Landroid/widget/TextView;

    sget v2, Lcom/flyersoft/tools/A;->tapMode:I

    const/4 v4, 0x6

    if-ne v2, v4, :cond_a

    const/4 v2, 0x0

    goto :goto_6

    :cond_a
    const/16 v2, 0x8

    :goto_6
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 148
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageUp2:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 149
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageDown1:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 150
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageDown2:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 153
    :goto_7
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->tipLay:Landroid/view/View;

    sget-object v1, Lcom/flyersoft/moonreaderp/ClickTip;->tips:[I

    invoke-static {}, Lcom/flyersoft/moonreaderp/ClickTip;->getTipId()I

    move-result v2

    aget v1, v1, v2

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    return-void
.end method

.method private initView()V
    .locals 2

    .line 56
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ClickTip;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 57
    const-string v1, "hideModeZone"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 58
    iput-boolean v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->hideModeZone:Z

    .line 59
    :cond_0
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 60
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ClickTip;->finish()V

    return-void

    .line 64
    :cond_1
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pageUp1:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/ClickTip;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageUp1:Landroid/widget/TextView;

    .line 65
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pageUp2:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/ClickTip;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageUp2:Landroid/widget/TextView;

    .line 66
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pageUpTL:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/ClickTip;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageUpTL:Landroid/widget/TextView;

    .line 67
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pageUpTR:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/ClickTip;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageUpTR:Landroid/widget/TextView;

    .line 68
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->middle:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/ClickTip;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->middle:Landroid/widget/TextView;

    .line 69
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pageDown1:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/ClickTip;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageDown1:Landroid/widget/TextView;

    .line 70
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pageDown2:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/ClickTip;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->pageDown2:Landroid/widget/TextView;

    .line 71
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->bookmarkTv:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/ClickTip;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->bookmarkTv:Landroid/widget/TextView;

    .line 72
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->baseLay:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/ClickTip;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->baseLay:Landroid/view/View;

    .line 73
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->tipLay:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/ClickTip;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->tipLay:Landroid/view/View;

    .line 74
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/ClickTip;->initGallery()V

    .line 75
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ClickTip;->baseLay:Landroid/view/View;

    sget-object v1, Lcom/flyersoft/moonreaderp/ClickTip;->drawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 76
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->tapLay:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/ClickTip;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/ClickTip$2;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/ClickTip$2;-><init>(Lcom/flyersoft/moonreaderp/ClickTip;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 81
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/ClickTip;->initParams()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 32
    invoke-super {p0, p1}, Lcom/flyersoft/moonreaderp/MyActionBarActivity;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    .line 33
    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/ClickTip;->requestWindowFeature(I)Z

    .line 34
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ClickTip;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 v0, 0x400

    invoke-virtual {p1, v0}, Landroid/view/Window;->addFlags(I)V

    .line 35
    sget p1, Lcom/flyersoft/tools/A;->screenState:I

    invoke-static {p1}, Lcom/flyersoft/tools/A;->getScreenOrientation(I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/ClickTip;->setRequestedOrientation(I)V

    .line 36
    sget p1, Lcom/flyersoft/moonreaderp/R$layout;->click_tip:I

    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/ClickTip;->setContentView(I)V

    .line 37
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/ClickTip;->initView()V

    .line 39
    invoke-static {}, Lcom/flyersoft/tools/A;->Android15()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 40
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ClickTip;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    new-instance v0, Lcom/flyersoft/moonreaderp/ClickTip$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/ClickTip$1;-><init>(Lcom/flyersoft/moonreaderp/ClickTip;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnApplyWindowInsetsListener(Landroid/view/View$OnApplyWindowInsetsListener;)V

    :cond_0
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    const/4 v0, 0x0

    .line 86
    sput-object v0, Lcom/flyersoft/moonreaderp/ClickTip;->drawable:Landroid/graphics/drawable/Drawable;

    .line 87
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefControl;->selfPref:Lcom/flyersoft/moonreaderp/PrefControl;

    if-eqz v0, :cond_0

    .line 89
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefControl;->selfPref:Lcom/flyersoft/moonreaderp/PrefControl;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefControl;->gallery:Landroid/widget/Gallery;

    invoke-static {}, Lcom/flyersoft/moonreaderp/ClickTip;->getTipId()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Gallery;->setSelection(I)V

    .line 90
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefControl;->selfPref:Lcom/flyersoft/moonreaderp/PrefControl;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefControl;->setTapZoneEnable()V

    .line 92
    :cond_0
    invoke-super {p0}, Lcom/flyersoft/moonreaderp/MyActionBarActivity;->onDestroy()V

    return-void
.end method
