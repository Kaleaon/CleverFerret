.class public Lcom/flyersoft/moonreaderp/PrefPdf;
.super Lcom/flyersoft/moonreaderp/PrefOptions;
.source "PrefPdf.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field annotCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

.field b1:Landroid/widget/Button;

.field b2:Landroid/widget/Button;

.field fitPageCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

.field flip_speed_lay:Landroid/widget/LinearLayout;

.field flip_speed_sb:Landroid/widget/SeekBar;

.field flip_type_sp:Landroid/widget/Spinner;

.field glGroup:Landroid/widget/RadioGroup;

.field old_pdf_dual_page:Z

.field pdf:Lcom/flyersoft/books/PDFReader;

.field render_sp:Landroid/widget/Spinner;

.field rtoLCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

.field textReflowCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

.field theme_b:Landroid/widget/TextView;

.field thumbB:Lcom/google/android/material/materialswitch/MaterialSwitch;


# direct methods
.method static bridge synthetic -$$Nest$mrenderPageSelected(Lcom/flyersoft/moonreaderp/PrefPdf;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefPdf;->renderPageSelected(I)V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetFlipLayVisiblity(Lcom/flyersoft/moonreaderp/PrefPdf;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefPdf;->setFlipLayVisiblity()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mshowFlipOptions(Lcom/flyersoft/moonreaderp/PrefPdf;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefPdf;->showFlipOptions()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/flyersoft/books/PDFReader;Ljava/lang/String;)V
    .locals 1

    .line 40
    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->pref_pdf:I

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;-><init>(Landroid/content/Context;I)V

    .line 41
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->pdf:Lcom/flyersoft/books/PDFReader;

    .line 42
    invoke-virtual {p0, p3}, Lcom/flyersoft/moonreaderp/PrefPdf;->scrollToTitle(Ljava/lang/String;)V

    return-void
.end method

.method private renderPageSelected(I)V
    .locals 4

    .line 174
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->autoTv:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefPdf;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$array;->pdf_view_mode_items:I

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 175
    sput p1, Lcom/flyersoft/tools/A;->pdf_view_mode:I

    .line 176
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    const v1, 0x551e88e5

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 177
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->flip0:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    const/4 v2, 0x0

    if-nez p1, :cond_0

    move-object v3, v0

    goto :goto_0

    :cond_0
    move-object v3, v2

    :goto_0
    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 178
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->flip1:I

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    const/4 v3, 0x1

    if-ne p1, v3, :cond_1

    move-object v3, v0

    goto :goto_1

    :cond_1
    move-object v3, v2

    :goto_1
    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 179
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->flip2:I

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    const/4 v3, 0x2

    if-ne p1, v3, :cond_2

    goto :goto_2

    :cond_2
    move-object v0, v2

    :goto_2
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method private setFlipLayVisiblity()V
    .locals 4

    .line 219
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->resetLay:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    sget v1, Lcom/flyersoft/tools/A;->flip_animation:I

    const/16 v2, 0x8

    const/4 v3, 0x0

    if-nez v1, :cond_0

    const/16 v1, 0x8

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 220
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->flip_speed_lay:Landroid/widget/LinearLayout;

    invoke-static {}, Lcom/flyersoft/tools/A;->isFlipNone()Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    :goto_1
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    return-void
.end method

.method private setFlipSpinnerEvent()V
    .locals 5

    .line 224
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->flipLayout:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->rtoLCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v1

    const/4 v2, 0x0

    const/16 v3, 0x8

    if-nez v1, :cond_1

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x18

    if-ge v1, v4, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/16 v1, 0x8

    :goto_1
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 225
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->flipLayout:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-ne v0, v3, :cond_2

    return-void

    .line 228
    :cond_2
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefPdf$6;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/flyersoft/moonreaderp/PrefPdf$6;-><init>(Lcom/flyersoft/moonreaderp/PrefPdf;Landroid/os/Looper;)V

    const-wide/16 v3, 0x1f4

    .line 250
    invoke-virtual {v0, v2, v3, v4}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    return-void
.end method

.method private setPageImagesClick()V
    .locals 3

    .line 161
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefPdf$4;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefPdf$4;-><init>(Lcom/flyersoft/moonreaderp/PrefPdf;)V

    .line 168
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->flip0:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 169
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->flip1:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 170
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->flip2:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private showFlipOptions()V
    .locals 4

    .line 183
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->flip_speed_lay:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->flip_speed_lay:Landroid/widget/LinearLayout;

    .line 184
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pvFlipList:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->flip_type_sp:Landroid/widget/Spinner;

    .line 185
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pvFlipSpeed:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/SeekBar;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->flip_speed_sb:Landroid/widget/SeekBar;

    .line 187
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefPdf;->setFlipLayVisiblity()V

    .line 188
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->flip_speed_sb:Landroid/widget/SeekBar;

    const/16 v1, 0x32

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setMax(I)V

    .line 189
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->flip_speed_sb:Landroid/widget/SeekBar;

    sget v1, Lcom/flyersoft/tools/A;->flipSpeed:I

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 191
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefPdf;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getNewFlipAnimations(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v0

    .line 192
    new-instance v1, Landroid/widget/ArrayAdapter;

    .line 193
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefPdf;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x1090008

    invoke-direct {v1, v2, v3, v0}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    const v0, 0x1090009

    .line 194
    invoke-virtual {v1, v0}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 196
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->flip_type_sp:Landroid/widget/Spinner;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 197
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->flip_type_sp:Landroid/widget/Spinner;

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 198
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->flip_type_sp:Landroid/widget/Spinner;

    sget v1, Lcom/flyersoft/tools/A;->flip_animation:I

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setSelection(I)V

    .line 199
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->flip_type_sp:Landroid/widget/Spinner;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->checkNightTextColors(Landroid/view/View;)V

    .line 201
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->flip_speed_sb:Landroid/widget/SeekBar;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefPdf$5;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefPdf$5;-><init>(Lcom/flyersoft/moonreaderp/PrefPdf;)V

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 215
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefPdf;->setFlipSpinnerEvent()V

    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 3

    .line 255
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->forFuncSearch:Z

    if-eqz v0, :cond_0

    .line 256
    invoke-super {p0}, Lcom/flyersoft/moonreaderp/PrefOptions;->dismiss()V

    return-void

    .line 259
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->fitPageCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    .line 260
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-boolean v0, v0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v0, :cond_1

    .line 261
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->render_sp:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->comic_render_quality:I

    goto :goto_0

    .line 263
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->render_sp:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->pdf_render_quality:I

    .line 264
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->textReflowCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->pdf_text_button:Z

    .line 265
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->thumbB:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->pdf_show_thumb:Z

    .line 266
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->glGroup:Landroid/widget/RadioGroup;

    invoke-virtual {v0}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result v0

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->glRadio:I

    const/4 v2, 0x0

    if-ne v0, v1, :cond_2

    const/4 v0, 0x1

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    :goto_1
    sput-boolean v0, Lcom/radaee/pdf/Global;->gl:Z

    sput-boolean v0, Lcom/flyersoft/tools/A;->gl:Z

    .line 267
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->sv:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getScrollY()I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->prefpp:I

    .line 269
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-boolean v0, v0, Lcom/flyersoft/books/PDFReader;->isPdf:Z

    if-nez v0, :cond_4

    .line 270
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-boolean v0, v0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v0, :cond_3

    .line 271
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->annotCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->cbz_smooth:Z

    goto :goto_2

    .line 273
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->annotCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->djvu_smooth:Z

    .line 274
    :goto_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v0}, Lcom/flyersoft/books/PDFReader;->doPostInvalidate()V

    goto :goto_3

    .line 276
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->annotCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->pdf_annot_button:Z

    .line 278
    :goto_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-boolean v0, v0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v0, :cond_5

    .line 279
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->rtoLCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/radaee/pdf/Global;->cbzRtol:Z

    goto :goto_4

    .line 280
    :cond_5
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-boolean v0, v0, Lcom/flyersoft/books/PDFReader;->isDjvu:Z

    if-eqz v0, :cond_6

    .line 281
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->rtoLCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/radaee/pdf/Global;->djvuRtol:Z

    goto :goto_4

    .line 283
    :cond_6
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->rtoLCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/radaee/pdf/Global;->rtol:Z

    .line 284
    :goto_4
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->rtoLCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 285
    sput v2, Lcom/radaee/pdf/Global;->flip_pdf:I

    sput v2, Lcom/flyersoft/tools/A;->flip_pdf:I

    sput v2, Lcom/flyersoft/tools/A;->flip_animation:I

    .line 287
    :cond_7
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->res:Landroid/content/Context;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->SaveOptions(Landroid/content/Context;)V

    .line 288
    invoke-super {p0}, Lcom/flyersoft/moonreaderp/PrefOptions;->dismiss()V

    return-void
.end method

.method public initView()V
    .locals 5

    .line 70
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pvLoadFromTheme:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->theme_b:Landroid/widget/TextView;

    .line 71
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->render_sp:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->render_sp:Landroid/widget/Spinner;

    .line 72
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->settingButton1:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->b1:Landroid/widget/Button;

    .line 73
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->settingButton2:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->b2:Landroid/widget/Button;

    .line 75
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->theme_b:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    .line 76
    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 77
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->theme_b:Landroid/widget/TextView;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 79
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->b1:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 80
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->b2:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 81
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->theme_b:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 82
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->bgColor:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefPdf;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 83
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pvResetFlip:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefPdf;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 86
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->bgColor:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/imageview/ShapeableImageView;

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-boolean v3, v3, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v3, :cond_1

    sget v3, Lcom/flyersoft/tools/A;->cbz_back_color:I

    goto :goto_0

    :cond_1
    sget v3, Lcom/flyersoft/tools/A;->pdf_back_color:I

    :goto_0
    invoke-direct {v1, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/google/android/material/imageview/ShapeableImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 87
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->render_sp:Landroid/widget/Spinner;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-boolean v1, v1, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v1, :cond_2

    sget v1, Lcom/flyersoft/tools/A;->comic_render_quality:I

    goto :goto_1

    :cond_2
    sget v1, Lcom/flyersoft/tools/A;->pdf_render_quality:I

    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setSelection(I)V

    .line 88
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->textReflowB:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->textReflowCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

    .line 89
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->annotB:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->annotCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

    .line 90
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->fitPage:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->fitPageCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

    .line 91
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->textReflowCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v1, Lcom/flyersoft/tools/A;->pdf_text_button:Z

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 93
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->rtoLCb:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->rtoLCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

    .line 94
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-boolean v1, v1, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v1, :cond_3

    sget-boolean v1, Lcom/radaee/pdf/Global;->cbzRtol:Z

    goto :goto_2

    :cond_3
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-boolean v1, v1, Lcom/flyersoft/books/PDFReader;->isDjvu:Z

    if-eqz v1, :cond_4

    sget-boolean v1, Lcom/radaee/pdf/Global;->djvuRtol:Z

    goto :goto_2

    :cond_4
    sget-boolean v1, Lcom/radaee/pdf/Global;->rtol:Z

    :goto_2
    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 95
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->rtoLCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefPdf$1;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefPdf$1;-><init>(Lcom/flyersoft/moonreaderp/PrefPdf;)V

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 102
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefPdf;->showFlipOptions()V

    .line 104
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->glGroup:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioGroup;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->glGroup:Landroid/widget/RadioGroup;

    .line 105
    sget-boolean v1, Lcom/flyersoft/tools/A;->gl:Z

    if-eqz v1, :cond_5

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->glRadio:I

    goto :goto_3

    :cond_5
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->normalRadio:I

    :goto_3
    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->check(I)V

    .line 107
    sget-boolean v0, Lcom/flyersoft/tools/A;->pdf_dual_page:Z

    iput-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->old_pdf_dual_page:Z

    .line 109
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->thumbB:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->thumbB:Lcom/google/android/material/materialswitch/MaterialSwitch;

    .line 110
    sget-boolean v1, Lcom/flyersoft/tools/A;->pdf_show_thumb:Z

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 112
    sget v0, Lcom/flyersoft/tools/A;->pdf_view_mode:I

    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/PrefPdf;->renderPageSelected(I)V

    .line 113
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefPdf;->setPageImagesClick()V

    .line 115
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-boolean v0, v0, Lcom/flyersoft/books/PDFReader;->isPdf:Z

    const/16 v1, 0x8

    if-nez v0, :cond_9

    .line 116
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-boolean v0, v0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-nez v0, :cond_6

    .line 117
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->renderLay:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 118
    :cond_6
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-boolean v0, v0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v0, :cond_7

    .line 119
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->textReflowCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setVisibility(I)V

    .line 120
    :cond_7
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->annotCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->font_antialias:I

    invoke-virtual {v0, v3}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setText(I)V

    .line 121
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->annotCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-boolean v3, v3, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v3, :cond_8

    sget-boolean v3, Lcom/flyersoft/tools/A;->cbz_smooth:Z

    goto :goto_4

    :cond_8
    sget-boolean v3, Lcom/flyersoft/tools/A;->djvu_smooth:Z

    :goto_4
    invoke-virtual {v0, v3}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 122
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->thumbB:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setVisibility(I)V

    .line 123
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->fitPageCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setVisibility(I)V

    .line 124
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->glLay:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_5

    .line 126
    :cond_9
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->annotCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v3, Lcom/flyersoft/tools/A;->pdf_annot_button:Z

    invoke-virtual {v0, v3}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 127
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->fitPageCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v3, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    invoke-virtual {v0, v3}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 130
    :goto_5
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->gap:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/views/CustomSeek;

    .line 131
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-boolean v3, v3, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v3, :cond_a

    .line 132
    invoke-virtual {v0, v1}, Lcom/flyersoft/views/CustomSeek;->setVisibility(I)V

    goto :goto_7

    .line 134
    :cond_a
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-boolean v3, v3, Lcom/flyersoft/books/PDFReader;->isPdf:Z

    if-eqz v3, :cond_b

    sget v3, Lcom/flyersoft/tools/A;->pdf_page_gap:I

    goto :goto_6

    :cond_b
    sget v3, Lcom/flyersoft/tools/A;->djvu_page_gap:I

    :goto_6
    const/16 v4, 0xa

    invoke-virtual {v0, v2, v4, v3}, Lcom/flyersoft/views/CustomSeek;->init(III)V

    .line 135
    iget-object v2, v0, Lcom/flyersoft/views/CustomSeek;->valueTv:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 136
    iget-object v1, v0, Lcom/flyersoft/views/CustomSeek;->titleTv:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    const/high16 v2, 0x43160000    # 150.0f

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 137
    new-instance v1, Lcom/flyersoft/moonreaderp/PrefPdf$2;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefPdf$2;-><init>(Lcom/flyersoft/moonreaderp/PrefPdf;)V

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/CustomSeek;->setOnCustomProgressChanged(Lcom/flyersoft/views/CustomSeek$OnProgressChanged;)V

    .line 148
    :goto_7
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->forFuncSearch:Z

    if-nez v0, :cond_c

    sget v0, Lcom/flyersoft/tools/A;->prefpp:I

    if-lez v0, :cond_c

    .line 149
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->root:Landroid/view/View;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefPdf$3;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefPdf$3;-><init>(Lcom/flyersoft/moonreaderp/PrefPdf;)V

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_c
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 8

    .line 293
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->bgColor:I

    if-ne v0, v1, :cond_1

    .line 294
    new-instance v2, Lcom/flyersoft/moonreaderp/PrefColorPick;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->res:Landroid/content/Context;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefPdf;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->pdf_margin_color:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 296
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-boolean v0, v0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v0, :cond_0

    sget v0, Lcom/flyersoft/tools/A;->cbz_back_color:I

    goto :goto_0

    :cond_0
    sget v0, Lcom/flyersoft/tools/A;->pdf_back_color:I

    :goto_0
    move v6, v0

    new-instance v7, Lcom/flyersoft/moonreaderp/PrefPdf$7;

    invoke-direct {v7, p0}, Lcom/flyersoft/moonreaderp/PrefPdf$7;-><init>(Lcom/flyersoft/moonreaderp/PrefPdf;)V

    const/4 v5, 0x0

    invoke-direct/range {v2 .. v7}, Lcom/flyersoft/moonreaderp/PrefColorPick;-><init>(Landroid/content/Context;Ljava/lang/String;ZILcom/flyersoft/moonreaderp/PrefColorPick$OnSaveColor;)V

    .line 315
    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/PrefColorPick;->show()V

    .line 318
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pvResetFlip:I

    if-ne v0, v1, :cond_2

    .line 319
    invoke-static {}, Lcom/flyersoft/tools/A;->set_default_flip()V

    .line 320
    sget v0, Lcom/flyersoft/tools/A;->flip_pdf:I

    sput v0, Lcom/flyersoft/tools/A;->flip_animation:I

    .line 321
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefPdf;->showFlipOptions()V

    .line 324
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->theme_b:Landroid/widget/TextView;

    if-ne p1, v0, :cond_3

    .line 325
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefTheme;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->res:Landroid/content/Context;

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefPdf$8;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/PrefPdf$8;-><init>(Lcom/flyersoft/moonreaderp/PrefPdf;)V

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/flyersoft/moonreaderp/PrefTheme;-><init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefTheme$OnGetTheme;Z)V

    .line 334
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefTheme;->show()V

    .line 337
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->b1:Landroid/widget/Button;

    if-ne p1, v0, :cond_5

    .line 338
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefPdf;->cancel()V

    .line 339
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 340
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showControlOptions()V

    goto :goto_1

    .line 342
    :cond_4
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefControl;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefPdf;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefControl;->show()V

    .line 344
    :cond_5
    :goto_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->b2:Landroid/widget/Button;

    if-ne p1, v0, :cond_7

    .line 345
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefPdf;->cancel()V

    .line 346
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p1

    if-nez p1, :cond_6

    .line 347
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showMiscOptions()V

    return-void

    .line 349
    :cond_6
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefMisc;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefPdf;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/flyersoft/moonreaderp/PrefMisc;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefMisc;->show()V

    :cond_7
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 47
    invoke-super {p0, p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->onCreate(Landroid/os/Bundle;)V

    .line 48
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefPdf;->initView()V

    .line 49
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefPdf;->initParams()Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const v0, 0x3f4ccccd    # 0.8f

    .line 50
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setDim(F)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    .line 51
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-boolean v0, v0, Lcom/flyersoft/books/PDFReader;->isPdf:Z

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    goto :goto_0

    :cond_0
    const/4 v0, -0x2

    :goto_0
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setHeight(I)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/4 v0, 0x1

    .line 52
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setFullscreen(Z)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 53
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-boolean v1, v1, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v1, :cond_1

    const-string v1, "CBZ/CBR "

    goto :goto_1

    :cond_1
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-boolean v1, v1, Lcom/flyersoft/books/PDFReader;->isDjvu:Z

    if-eqz v1, :cond_2

    const-string v1, "DJVU "

    goto :goto_1

    :cond_2
    const-string v1, "PDF "

    :goto_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefPdf;->res:Landroid/content/Context;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->button_options:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setDialogTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/4 v0, 0x0

    .line 54
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setFuncSearchVisible(I)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    .line 55
    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->done()V

    return-void
.end method
