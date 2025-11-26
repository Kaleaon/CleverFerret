.class public Lcom/flyersoft/moonreaderp/PrefColorPick;
.super Lcom/flyersoft/moonreaderp/PrefOptions;
.source "PrefColorPick.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/moonreaderp/PrefColorPick$OnColorChangedListener;,
        Lcom/flyersoft/moonreaderp/PrefColorPick$OnSaveColor;,
        Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;,
        Lcom/flyersoft/moonreaderp/PrefColorPick$IconPreviewDrawable;
    }
.end annotation


# static fields
.field static locked:Z = false


# instance fields
.field alphaEt:Landroid/widget/EditText;

.field b1:Landroid/widget/Button;

.field b2:Landroid/widget/Button;

.field blueEt:Landroid/widget/EditText;

.field c1:Landroid/widget/ImageView;

.field c2:Landroid/widget/ImageView;

.field c3:Landroid/widget/ImageView;

.field c4:Landroid/widget/ImageView;

.field c5:Landroid/widget/ImageView;

.field c6:Landroid/widget/ImageView;

.field c7:Landroid/widget/ImageView;

.field c8:Landroid/widget/ImageView;

.field c9:Landroid/widget/ImageView;

.field private cAlpha:Landroid/widget/SeekBar;

.field private cB:Landroid/widget/SeekBar;

.field private cG:Landroid/widget/SeekBar;

.field private cR:Landroid/widget/SeekBar;

.field private cView:Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;

.field colorLay:Landroid/widget/LinearLayout;

.field disableTextChangeEvent:Z

.field etFocusChanged:Landroid/view/View$OnFocusChangeListener;

.field greenEt:Landroid/widget/EditText;

.field hexEt:Landroid/widget/EditText;

.field l:Lcom/flyersoft/moonreaderp/PrefColorPick$OnColorChangedListener;

.field private mColor:I

.field mContext:Landroid/content/Context;

.field private mListener:Lcom/flyersoft/moonreaderp/PrefColorPick$OnSaveColor;

.field private mUseAlpha:Z

.field preColor:I

.field preview:Lcom/google/android/material/imageview/ShapeableImageView;

.field previewBase:Landroid/view/View;

.field redEt:Landroid/widget/EditText;

.field title:Ljava/lang/String;


# direct methods
.method static bridge synthetic -$$Nest$fgetcAlpha(Lcom/flyersoft/moonreaderp/PrefColorPick;)Landroid/widget/SeekBar;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->cAlpha:Landroid/widget/SeekBar;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetcB(Lcom/flyersoft/moonreaderp/PrefColorPick;)Landroid/widget/SeekBar;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->cB:Landroid/widget/SeekBar;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetcG(Lcom/flyersoft/moonreaderp/PrefColorPick;)Landroid/widget/SeekBar;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->cG:Landroid/widget/SeekBar;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetcR(Lcom/flyersoft/moonreaderp/PrefColorPick;)Landroid/widget/SeekBar;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->cR:Landroid/widget/SeekBar;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmColor(Lcom/flyersoft/moonreaderp/PrefColorPick;)I
    .locals 0

    iget p0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->mColor:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmUseAlpha(Lcom/flyersoft/moonreaderp/PrefColorPick;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->mUseAlpha:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fputmColor(Lcom/flyersoft/moonreaderp/PrefColorPick;I)V
    .locals 0

    iput p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->mColor:I

    return-void
.end method

.method static bridge synthetic -$$Nest$msetRGBColor(Lcom/flyersoft/moonreaderp/PrefColorPick;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefColorPick;->setRGBColor(I)V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetRGBColor(Lcom/flyersoft/moonreaderp/PrefColorPick;IZ)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/moonreaderp/PrefColorPick;->setRGBColor(IZ)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mupdate(Lcom/flyersoft/moonreaderp/PrefColorPick;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefColorPick;->update()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;ZILcom/flyersoft/moonreaderp/PrefColorPick$OnSaveColor;)V
    .locals 1

    .line 76
    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->color_picker:I

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;-><init>(Landroid/content/Context;I)V

    const/4 v0, -0x1

    .line 59
    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->mColor:I

    .line 264
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefColorPick$4;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefColorPick$4;-><init>(Lcom/flyersoft/moonreaderp/PrefColorPick;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->etFocusChanged:Landroid/view/View$OnFocusChangeListener;

    .line 455
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefColorPick$5;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefColorPick$5;-><init>(Lcom/flyersoft/moonreaderp/PrefColorPick;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->l:Lcom/flyersoft/moonreaderp/PrefColorPick$OnColorChangedListener;

    .line 77
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->mContext:Landroid/content/Context;

    .line 78
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->title:Ljava/lang/String;

    .line 79
    iput-boolean p3, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->mUseAlpha:Z

    .line 80
    iput p4, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->preColor:I

    .line 81
    iput-object p5, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->mListener:Lcom/flyersoft/moonreaderp/PrefColorPick$OnSaveColor;

    return-void
.end method

.method public static colorToHex(IZZ)Ljava/lang/String;
    .locals 4

    .line 342
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x2

    const/16 v1, 0x8

    if-nez p1, :cond_0

    .line 343
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ne v2, v1, :cond_0

    .line 344
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 345
    :cond_0
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz p1, :cond_1

    const/16 v3, 0x8

    goto :goto_1

    :cond_1
    const/4 v3, 0x6

    :goto_1
    if-ge v2, v3, :cond_2

    .line 346
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "0"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_2
    if-eqz p2, :cond_3

    .line 347
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p1

    if-ne p1, v1, :cond_3

    .line 348
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 p2, 0x0

    invoke-virtual {p0, p2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " | "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :cond_3
    return-object p0
.end method

.method private hexEtSetText(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x1

    .line 353
    iput-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->disableTextChangeEvent:Z

    .line 354
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->hexEt:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    const/4 p1, 0x0

    .line 355
    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->disableTextChangeEvent:Z

    return-void
.end method

.method private initColorView2(Landroid/view/View;)V
    .locals 3

    .line 463
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->colorLay:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->colorLay:Landroid/widget/LinearLayout;

    .line 464
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->l:Lcom/flyersoft/moonreaderp/PrefColorPick$OnColorChangedListener;

    iget v2, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->mColor:I

    invoke-direct {p1, v0, v1, v2}, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;-><init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefColorPick$OnColorChangedListener;I)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->cView:Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;

    .line 465
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->colorLay:Landroid/widget/LinearLayout;

    const/4 v1, -0x1

    invoke-virtual {v0, p1, v1, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V

    return-void
.end method

.method private initSavedColors()V
    .locals 3

    .line 220
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->c1:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c1:Landroid/widget/ImageView;

    .line 221
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->c2:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c2:Landroid/widget/ImageView;

    .line 222
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->c3:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c3:Landroid/widget/ImageView;

    .line 223
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->c4:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c4:Landroid/widget/ImageView;

    .line 224
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->c5:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c5:Landroid/widget/ImageView;

    .line 225
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->c6:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c6:Landroid/widget/ImageView;

    .line 226
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->c7:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c7:Landroid/widget/ImageView;

    .line 227
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->c8:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c8:Landroid/widget/ImageView;

    .line 228
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->c9:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c9:Landroid/widget/ImageView;

    .line 229
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c1:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 230
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c2:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 231
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c3:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 232
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c4:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 233
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c5:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 234
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c6:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 235
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c7:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 236
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c8:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 237
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c9:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 238
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c1:Landroid/widget/ImageView;

    const/high16 v1, -0x10000

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 239
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c2:Landroid/widget/ImageView;

    const/4 v1, -0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 240
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c3:Landroid/widget/ImageView;

    const/16 v1, -0x100

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 241
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c4:Landroid/widget/ImageView;

    const v1, -0xff0100

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 242
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c5:Landroid/widget/ImageView;

    const v1, -0x777778

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 243
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c6:Landroid/widget/ImageView;

    const v1, -0xff0001

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 244
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c7:Landroid/widget/ImageView;

    const v1, -0xffff01

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 245
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c8:Landroid/widget/ImageView;

    const/high16 v1, -0x1000000

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 246
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c9:Landroid/widget/ImageView;

    const v1, -0xff01

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 247
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c1:Landroid/widget/ImageView;

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c1:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 248
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c2:Landroid/widget/ImageView;

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c2:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 249
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c3:Landroid/widget/ImageView;

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c3:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 250
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c4:Landroid/widget/ImageView;

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c4:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 251
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c5:Landroid/widget/ImageView;

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c5:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 252
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c6:Landroid/widget/ImageView;

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c6:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 253
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c7:Landroid/widget/ImageView;

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c7:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 254
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c8:Landroid/widget/ImageView;

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c8:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 255
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c9:Landroid/widget/ImageView;

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c9:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method private initView(Ljava/lang/String;I)V
    .locals 2

    .line 100
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->root:Landroid/view/View;

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->preview:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/imageview/ShapeableImageView;

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->preview:Lcom/google/android/material/imageview/ShapeableImageView;

    .line 102
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->root:Landroid/view/View;

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->hue:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/SeekBar;

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->cR:Landroid/widget/SeekBar;

    .line 103
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->root:Landroid/view/View;

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->saturation:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/SeekBar;

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->cG:Landroid/widget/SeekBar;

    .line 104
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->root:Landroid/view/View;

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->value:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/SeekBar;

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->cB:Landroid/widget/SeekBar;

    .line 105
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->root:Landroid/view/View;

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->alpha:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/SeekBar;

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->cAlpha:Landroid/widget/SeekBar;

    .line 106
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->root:Landroid/view/View;

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->redEt:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->redEt:Landroid/widget/EditText;

    .line 107
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->root:Landroid/view/View;

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->greenEt:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->greenEt:Landroid/widget/EditText;

    .line 108
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->root:Landroid/view/View;

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->blueEt:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->blueEt:Landroid/widget/EditText;

    .line 109
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->root:Landroid/view/View;

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->alphaEt:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->alphaEt:Landroid/widget/EditText;

    .line 110
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->root:Landroid/view/View;

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->hexEt:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->hexEt:Landroid/widget/EditText;

    .line 112
    sget-boolean p1, Lcom/flyersoft/tools/A;->isTablet:Z

    if-eqz p1, :cond_0

    .line 113
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->redEt:Landroid/widget/EditText;

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefColorPick;->setEtSize(Landroid/widget/EditText;)V

    .line 114
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->greenEt:Landroid/widget/EditText;

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefColorPick;->setEtSize(Landroid/widget/EditText;)V

    .line 115
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->blueEt:Landroid/widget/EditText;

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefColorPick;->setEtSize(Landroid/widget/EditText;)V

    .line 116
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->alphaEt:Landroid/widget/EditText;

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefColorPick;->setEtSize(Landroid/widget/EditText;)V

    .line 120
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->redEt:Landroid/widget/EditText;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->etFocusChanged:Landroid/view/View$OnFocusChangeListener;

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 121
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->greenEt:Landroid/widget/EditText;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->etFocusChanged:Landroid/view/View$OnFocusChangeListener;

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 122
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->blueEt:Landroid/widget/EditText;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->etFocusChanged:Landroid/view/View$OnFocusChangeListener;

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 123
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->alphaEt:Landroid/widget/EditText;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->etFocusChanged:Landroid/view/View$OnFocusChangeListener;

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 125
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->root:Landroid/view/View;

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->okB:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->b1:Landroid/widget/Button;

    .line 126
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->root:Landroid/view/View;

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->cancelB:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->b2:Landroid/widget/Button;

    .line 127
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->b1:Landroid/widget/Button;

    invoke-virtual {p1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 128
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->b2:Landroid/widget/Button;

    invoke-virtual {p1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 129
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefColorPick;->initSavedColors()V

    .line 130
    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->mUseAlpha:Z

    if-nez p1, :cond_1

    .line 131
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->root:Landroid/view/View;

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->alpaLay:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    const/4 p1, -0x1

    if-ne p2, p1, :cond_2

    const/4 v0, -0x2

    goto :goto_0

    :cond_2
    move v0, p2

    .line 133
    :goto_0
    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/PrefColorPick;->setRGBColor(I)V

    .line 134
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->root:Landroid/view/View;

    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/PrefColorPick;->initColorView2(Landroid/view/View;)V

    if-ne p2, p1, :cond_3

    .line 136
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefColorPick$1;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p2

    invoke-direct {p1, p0, p2}, Lcom/flyersoft/moonreaderp/PrefColorPick$1;-><init>(Lcom/flyersoft/moonreaderp/PrefColorPick;Landroid/os/Looper;)V

    const/4 p2, 0x0

    const-wide/16 v0, 0x32

    .line 141
    invoke-virtual {p1, p2, v0, v1}, Lcom/flyersoft/moonreaderp/PrefColorPick$1;->sendEmptyMessageDelayed(IJ)Z

    .line 143
    :cond_3
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefColorPick;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/4 p2, 0x3

    invoke-virtual {p1, p2}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 144
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefColorPick;->setHexEdit()V

    .line 146
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->alphaEt:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "0"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 147
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->alphaEt:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getPaint()Landroid/text/TextPaint;

    move-result-object p1

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/text/TextPaint;->setFakeBoldText(Z)V

    .line 148
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->alphaEt:Landroid/widget/EditText;

    new-instance p2, Lcom/flyersoft/moonreaderp/PrefColorPick$2;

    invoke-direct {p2, p0}, Lcom/flyersoft/moonreaderp/PrefColorPick$2;-><init>(Lcom/flyersoft/moonreaderp/PrefColorPick;)V

    const-wide/16 v0, 0x64

    invoke-virtual {p1, p2, v0, v1}, Landroid/widget/EditText;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_4
    return-void
.end method

.method private setEtSize(Landroid/widget/EditText;)V
    .locals 1

    .line 261
    invoke-virtual {p1}, Landroid/widget/EditText;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    const/high16 v0, 0x42700000    # 60.0f

    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    return-void
.end method

.method private setHexEdit()V
    .locals 2

    .line 159
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->hexTv:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-boolean v1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->mUseAlpha:Z

    if-eqz v1, :cond_0

    const-string v1, "HEX(RGB|ARGB): "

    goto :goto_0

    :cond_0
    const-string v1, "HEX(RGB): "

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 161
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->hexEt:Landroid/widget/EditText;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefColorPick$3;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefColorPick$3;-><init>(Lcom/flyersoft/moonreaderp/PrefColorPick;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    return-void
.end method

.method private setRGBColor(I)V
    .locals 1

    const/4 v0, 0x1

    .line 297
    invoke-direct {p0, p1, v0}, Lcom/flyersoft/moonreaderp/PrefColorPick;->setRGBColor(IZ)V

    return-void
.end method

.method private setRGBColor(IZ)V
    .locals 4

    const/4 v0, 0x1

    .line 301
    sput-boolean v0, Lcom/flyersoft/moonreaderp/PrefColorPick;->locked:Z

    .line 302
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->cR:Landroid/widget/SeekBar;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->redEt:Landroid/widget/EditText;

    const-string v2, "Red"

    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v3

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/flyersoft/moonreaderp/PrefColorPick;->setupSeekBar(Landroid/widget/SeekBar;Landroid/widget/EditText;Ljava/lang/String;I)V

    .line 303
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->cG:Landroid/widget/SeekBar;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->greenEt:Landroid/widget/EditText;

    const-string v2, "Green"

    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v3

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/flyersoft/moonreaderp/PrefColorPick;->setupSeekBar(Landroid/widget/SeekBar;Landroid/widget/EditText;Ljava/lang/String;I)V

    .line 304
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->cB:Landroid/widget/SeekBar;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->blueEt:Landroid/widget/EditText;

    const-string v2, "Blue"

    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result v3

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/flyersoft/moonreaderp/PrefColorPick;->setupSeekBar(Landroid/widget/SeekBar;Landroid/widget/EditText;Ljava/lang/String;I)V

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    .line 307
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v1, "#"

    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->mUseAlpha:Z

    invoke-static {p1, v1, v0}, Lcom/flyersoft/moonreaderp/PrefColorPick;->colorToHex(IZZ)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p2}, Lcom/flyersoft/moonreaderp/PrefColorPick;->hexEtSetText(Ljava/lang/String;)V

    .line 309
    :cond_0
    iget-boolean p2, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->mUseAlpha:Z

    if-eqz p2, :cond_1

    .line 310
    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result p2

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->cAlpha:Landroid/widget/SeekBar;

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getMax()I

    move-result v1

    mul-int p2, p2, v1

    div-int/lit16 p2, p2, 0xff

    .line 311
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->cAlpha:Landroid/widget/SeekBar;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->alphaEt:Landroid/widget/EditText;

    const-string v3, "Alpha"

    invoke-direct {p0, v1, v2, v3, p2}, Lcom/flyersoft/moonreaderp/PrefColorPick;->setupSeekBar(Landroid/widget/SeekBar;Landroid/widget/EditText;Ljava/lang/String;I)V

    goto :goto_0

    .line 313
    :cond_1
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->cAlpha:Landroid/widget/SeekBar;

    const/16 v1, 0x8

    invoke-virtual {p2, v1}, Landroid/widget/SeekBar;->setVisibility(I)V

    .line 316
    :goto_0
    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefColorPick;->updatePreview(I)V

    .line 317
    iput p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->mColor:I

    .line 318
    sput-boolean v0, Lcom/flyersoft/moonreaderp/PrefColorPick;->locked:Z

    return-void
.end method

.method private setupSeekBar(Landroid/widget/SeekBar;Landroid/widget/EditText;Ljava/lang/String;I)V
    .locals 1

    .line 371
    invoke-virtual {p1, p4}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 372
    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, ""

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 373
    invoke-virtual {p1, p0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    return-void
.end method

.method private update()V
    .locals 7

    .line 322
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->cR:Landroid/widget/SeekBar;

    invoke-virtual {v0}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    .line 323
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->cG:Landroid/widget/SeekBar;

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getProgress()I

    move-result v1

    .line 324
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->cB:Landroid/widget/SeekBar;

    invoke-virtual {v2}, Landroid/widget/SeekBar;->getProgress()I

    move-result v2

    .line 325
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->cAlpha:Landroid/widget/SeekBar;

    invoke-virtual {v3}, Landroid/widget/SeekBar;->getProgress()I

    move-result v3

    .line 326
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->redEt:Landroid/widget/EditText;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, ""

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 327
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->greenEt:Landroid/widget/EditText;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 328
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->blueEt:Landroid/widget/EditText;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 329
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->alphaEt:Landroid/widget/EditText;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 330
    iget-boolean v4, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->mUseAlpha:Z

    if-eqz v4, :cond_0

    .line 331
    invoke-static {v3, v0, v1, v2}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->mColor:I

    goto :goto_0

    .line 333
    :cond_0
    invoke-static {v0, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->mColor:I

    .line 336
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "#"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->mColor:I

    iget-boolean v2, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->mUseAlpha:Z

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Lcom/flyersoft/moonreaderp/PrefColorPick;->colorToHex(IZZ)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/PrefColorPick;->hexEtSetText(Ljava/lang/String;)V

    .line 337
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->mColor:I

    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/PrefColorPick;->updatePreview(I)V

    .line 338
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->root:Landroid/view/View;

    const-wide/16 v1, 0x32

    invoke-virtual {v0, v1, v2}, Landroid/view/View;->postInvalidateDelayed(J)V

    return-void
.end method

.method private updatePreview(I)V
    .locals 3

    .line 382
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->preview:Lcom/google/android/material/imageview/ShapeableImageView;

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    iget-boolean v2, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->mUseAlpha:Z

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    const/high16 v2, -0x1000000

    or-int/2addr p1, v2

    :goto_0
    invoke-direct {v1, p1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/google/android/material/imageview/ShapeableImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method


# virtual methods
.method protected getValue(Landroid/widget/EditText;)I
    .locals 1

    .line 359
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-gez p1, :cond_0

    const/4 p1, 0x0

    :cond_0
    const/16 v0, 0xff

    if-le p1, v0, :cond_1

    return v0

    :cond_1
    return p1
.end method

.method public onClick(Landroid/view/View;)V
    .locals 5

    .line 595
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->b1:Landroid/widget/Button;

    if-ne p1, v0, :cond_2

    .line 597
    :try_start_0
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->mUseAlpha:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->alphaEt:Landroid/widget/EditText;

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefColorPick;->getValue(Landroid/widget/EditText;)I

    move-result v0

    goto :goto_0

    :cond_0
    const/16 v0, 0xff

    .line 600
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->redEt:Landroid/widget/EditText;

    invoke-virtual {p0, v1}, Lcom/flyersoft/moonreaderp/PrefColorPick;->getValue(Landroid/widget/EditText;)I

    move-result v1

    .line 601
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->greenEt:Landroid/widget/EditText;

    invoke-virtual {p0, v2}, Lcom/flyersoft/moonreaderp/PrefColorPick;->getValue(Landroid/widget/EditText;)I

    move-result v2

    .line 602
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->blueEt:Landroid/widget/EditText;

    invoke-virtual {p0, v3}, Lcom/flyersoft/moonreaderp/PrefColorPick;->getValue(Landroid/widget/EditText;)I

    move-result v3

    .line 603
    iget-boolean v4, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->mUseAlpha:Z

    if-eqz v4, :cond_1

    .line 604
    invoke-static {v0, v1, v2, v3}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->mColor:I

    goto :goto_1

    .line 606
    :cond_1
    invoke-static {v1, v2, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->mColor:I

    .line 607
    :goto_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->mListener:Lcom/flyersoft/moonreaderp/PrefColorPick$OnSaveColor;

    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->mColor:I

    invoke-interface {v0, v1}, Lcom/flyersoft/moonreaderp/PrefColorPick$OnSaveColor;->getColor(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v0

    .line 609
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 611
    :goto_2
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefColorPick;->cancel()V

    .line 614
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->b2:Landroid/widget/Button;

    if-ne p1, v0, :cond_3

    .line 615
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefColorPick;->cancel()V

    .line 618
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c1:Landroid/widget/ImageView;

    if-eq p1, v0, :cond_4

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c2:Landroid/widget/ImageView;

    if-eq p1, v0, :cond_4

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c3:Landroid/widget/ImageView;

    if-eq p1, v0, :cond_4

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c4:Landroid/widget/ImageView;

    if-eq p1, v0, :cond_4

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c5:Landroid/widget/ImageView;

    if-eq p1, v0, :cond_4

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c6:Landroid/widget/ImageView;

    if-eq p1, v0, :cond_4

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c7:Landroid/widget/ImageView;

    if-eq p1, v0, :cond_4

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c8:Landroid/widget/ImageView;

    if-eq p1, v0, :cond_4

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->c9:Landroid/widget/ImageView;

    if-ne p1, v0, :cond_5

    .line 619
    :cond_4
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 620
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->mColor:I

    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v1

    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v2

    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result p1

    invoke-static {v0, v1, v2, p1}, Landroid/graphics/Color;->argb(IIII)I

    move-result p1

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefColorPick;->setRGBColor(I)V

    :cond_5
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 86
    invoke-super {p0, p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->onCreate(Landroid/os/Bundle;)V

    .line 87
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->title:Ljava/lang/String;

    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->preColor:I

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/moonreaderp/PrefColorPick;->initView(Ljava/lang/String;I)V

    .line 88
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefColorPick;->initParams()Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const v0, 0x3f4ccccd    # 0.8f

    .line 89
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setDim(F)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/4 v0, -0x2

    .line 90
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setHeight(I)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/4 v0, 0x1

    .line 91
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setFullscreen(Z)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    .line 92
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setHideExit(Z)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->title:Ljava/lang/String;

    .line 93
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setDialogTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    .line 94
    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->done()V

    .line 95
    sget-boolean p1, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz p1, :cond_0

    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result p1

    if-nez p1, :cond_0

    .line 96
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick;->root:Landroid/view/View;

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->middleLay:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/A;->forceDayTextColors(Landroid/view/View;)V

    :cond_0
    return-void
.end method

.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 0

    if-eqz p3, :cond_0

    .line 388
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefColorPick;->update()V

    :cond_0
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0

    .line 71
    invoke-super {p0, p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->onWindowFocusChanged(Z)V

    return-void
.end method
