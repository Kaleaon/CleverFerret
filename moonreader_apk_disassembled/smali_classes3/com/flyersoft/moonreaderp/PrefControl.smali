.class public Lcom/flyersoft/moonreaderp/PrefControl;
.super Lcom/flyersoft/moonreaderp/PrefOptions;
.source "PrefControl.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field public static actionAdapter:Landroid/widget/ArrayAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/widget/ArrayAdapter<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static selfPref:Lcom/flyersoft/moonreaderp/PrefControl;


# instance fields
.field b1:Landroid/widget/Button;

.field b2:Landroid/widget/Button;

.field fling_tip:Landroid/widget/TextView;

.field public gallery:Landroid/widget/Gallery;

.field kLay:Landroid/widget/LinearLayout;

.field keycodeNames:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field leftSp:Landroid/widget/Spinner;

.field leftSp2:Landroid/widget/Spinner;

.field middleSp:Landroid/widget/Spinner;

.field middleSp2:Landroid/widget/Spinner;

.field nine_grid:Landroid/widget/TextView;

.field rightSp:Landroid/widget/Spinner;

.field rightSp2:Landroid/widget/Spinner;

.field statusbar_tip:Landroid/widget/TextView;

.field vscroll_tip:Landroid/widget/TextView;


# direct methods
.method static bridge synthetic -$$Nest$mcreateKeycodeListView(Lcom/flyersoft/moonreaderp/PrefControl;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->createKeycodeListView()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mgetAction(Lcom/flyersoft/moonreaderp/PrefControl;II)I
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/moonreaderp/PrefControl;->getAction(II)I

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$mgetAction(Lcom/flyersoft/moonreaderp/PrefControl;Landroid/widget/Spinner;I)I
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/moonreaderp/PrefControl;->getAction(Landroid/widget/Spinner;I)I

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$mloadOptions(Lcom/flyersoft/moonreaderp/PrefControl;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->loadOptions()V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetNineGridEvents(Lcom/flyersoft/moonreaderp/PrefControl;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->setNineGridEvents()V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetNineGridText(Lcom/flyersoft/moonreaderp/PrefControl;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->setNineGridText()V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetSelection(Lcom/flyersoft/moonreaderp/PrefControl;II)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 48
    invoke-direct {p0, p1, v0}, Lcom/flyersoft/moonreaderp/PrefControl;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .line 51
    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->pref_control:I

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;-><init>(Landroid/content/Context;I)V

    .line 52
    invoke-virtual {p0, p2}, Lcom/flyersoft/moonreaderp/PrefControl;->scrollToTitle(Ljava/lang/String;)V

    return-void
.end method

.method private createKeycodeItem(Ljava/lang/Integer;)V
    .locals 4

    .line 532
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$layout;->keycode_item:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 533
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getKeycodeNames()Ljava/util/HashMap;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 534
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->tv:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, ""

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 535
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->sp:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Spinner;

    .line 536
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefControl;->kLay:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 538
    invoke-virtual {v1, p1}, Landroid/widget/Spinner;->setTag(Ljava/lang/Object;)V

    .line 539
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSpinnerList(Landroid/content/Context;Landroid/widget/Spinner;)V

    .line 540
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2}, Lcom/flyersoft/tools/A;->getKeycodeEvent(I)I

    move-result v2

    invoke-direct {p0, v1, v2}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(Landroid/widget/Spinner;I)V

    .line 542
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->op:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 543
    sget p1, Lcom/flyersoft/moonreaderp/R$id;->op:I

    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefControl$13;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefControl$13;-><init>(Lcom/flyersoft/moonreaderp/PrefControl;)V

    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 550
    invoke-static {v0}, Lcom/flyersoft/tools/A;->checkNightTextColors(Landroid/view/View;)V

    return-void
.end method

.method private createKeycodeListView()V
    .locals 2

    .line 525
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->kLay:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    if-lez v0, :cond_0

    .line 526
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->kLay:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 527
    :cond_0
    invoke-static {}, Lcom/flyersoft/tools/A;->getKeycodeListForEvent()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 528
    invoke-direct {p0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->createKeycodeItem(Ljava/lang/Integer;)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method private getAction(II)I
    .locals 1

    .line 355
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->root:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Spinner;

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/moonreaderp/PrefControl;->getAction(Landroid/widget/Spinner;I)I

    move-result p1

    return p1
.end method

.method private getAction(Landroid/widget/Spinner;I)I
    .locals 1

    .line 358
    invoke-virtual {p1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result p1

    .line 359
    invoke-static {}, Lcom/flyersoft/tools/A;->isPro()Z

    move-result v0

    if-nez v0, :cond_1

    const/16 v0, 0x13

    if-ne p1, v0, :cond_1

    if-ne p2, v0, :cond_0

    const/16 p1, 0xf

    return p1

    :cond_0
    return p2

    :cond_1
    return p1
.end method

.method public static getActionItems(Landroid/content/Context;)[Ljava/lang/String;
    .locals 5

    .line 282
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$array;->controls:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    .line 283
    array-length v1, v0

    add-int/lit8 v2, v1, 0xe

    new-array v2, v2, [Ljava/lang/String;

    .line 285
    sget v3, Lcom/flyersoft/moonreaderp/R$string;->speak:I

    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v1

    add-int/lit8 v3, v1, 0x1

    .line 286
    sget v4, Lcom/flyersoft/moonreaderp/R$string;->button_brightness:I

    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    add-int/lit8 v3, v1, 0x2

    .line 287
    sget v4, Lcom/flyersoft/moonreaderp/R$string;->visual_options:I

    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    add-int/lit8 v3, v1, 0x3

    .line 288
    sget v4, Lcom/flyersoft/moonreaderp/R$string;->control_options:I

    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    add-int/lit8 v3, v1, 0x4

    .line 289
    sget v4, Lcom/flyersoft/moonreaderp/R$string;->miscellaneous:I

    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    add-int/lit8 v3, v1, 0x5

    .line 290
    sget v4, Lcom/flyersoft/moonreaderp/R$string;->page_move_up:I

    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    add-int/lit8 v3, v1, 0x6

    .line 291
    sget v4, Lcom/flyersoft/moonreaderp/R$string;->page_move_down:I

    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    add-int/lit8 v3, v1, 0x7

    .line 293
    sget v4, Lcom/flyersoft/moonreaderp/R$string;->button_orientation:I

    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    add-int/lit8 v3, v1, 0x8

    .line 294
    sget v4, Lcom/flyersoft/moonreaderp/R$string;->button_daynight:I

    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    add-int/lit8 v3, v1, 0x9

    .line 295
    sget v4, Lcom/flyersoft/moonreaderp/R$string;->tilt_turn_page:I

    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    add-int/lit8 v3, v1, 0xa

    .line 296
    sget v4, Lcom/flyersoft/moonreaderp/R$string;->button_dualpage:I

    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    add-int/lit8 v3, v1, 0xb

    .line 297
    sget v4, Lcom/flyersoft/moonreaderp/R$string;->reading_ruler:I

    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    add-int/lit8 v3, v1, 0xc

    .line 298
    sget v4, Lcom/flyersoft/moonreaderp/R$string;->sync_to_cloud:I

    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/flyersoft/tools/T;->deleteEndQuotes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    add-int/lit8 v1, v1, 0xd

    .line 299
    sget v3, Lcom/flyersoft/moonreaderp/R$string;->sync_from_cloud:I

    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/flyersoft/tools/T;->deleteEndQuotes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v2, v1

    const/4 p0, 0x0

    .line 301
    :goto_0
    array-length v1, v0

    if-ge p0, v1, :cond_0

    .line 302
    aget-object v1, v0, p0

    aput-object v1, v2, p0

    add-int/lit8 p0, p0, 0x1

    goto :goto_0

    :cond_0
    return-object v2
.end method

.method private initActionList(Landroid/view/ViewGroup;)V
    .locals 4

    const/4 v0, 0x0

    .line 145
    :goto_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 146
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 147
    instance-of v2, v1, Landroid/view/ViewGroup;

    if-eqz v2, :cond_0

    .line 148
    move-object v2, v1

    check-cast v2, Landroid/view/ViewGroup;

    invoke-direct {p0, v2}, Lcom/flyersoft/moonreaderp/PrefControl;->initActionList(Landroid/view/ViewGroup;)V

    .line 149
    :cond_0
    instance-of v2, v1, Landroid/widget/Spinner;

    if-eqz v2, :cond_1

    .line 150
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v2

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pcScreen:I

    if-eq v2, v3, :cond_1

    .line 151
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v2

    check-cast v1, Landroid/widget/Spinner;

    invoke-static {v2, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSpinnerList(Landroid/content/Context;Landroid/widget/Spinner;)V

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method private initGallery()V
    .locals 3

    .line 567
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->gallery1:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Gallery;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->gallery:Landroid/widget/Gallery;

    .line 568
    new-instance v1, Lcom/flyersoft/moonreaderp/ClickTip$GalleryAdapter;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/flyersoft/moonreaderp/ClickTip$GalleryAdapter;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/widget/Gallery;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 569
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->gallery:Landroid/widget/Gallery;

    invoke-static {}, Lcom/flyersoft/moonreaderp/ClickTip;->getTipId()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Gallery;->setSelection(I)V

    .line 570
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->gallery:Landroid/widget/Gallery;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefControl$14;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefControl$14;-><init>(Lcom/flyersoft/moonreaderp/PrefControl;)V

    invoke-virtual {v0, v1}, Landroid/widget/Gallery;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    return-void
.end method

.method private loadOptions()V
    .locals 2

    .line 169
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->setScreenOrientation()V

    .line 170
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcShake:I

    sget v1, Lcom/flyersoft/tools/A;->doShakePhone:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(II)V

    .line 171
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcTapTop:I

    sget v1, Lcom/flyersoft/tools/A;->doTapScreenTop:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(II)V

    .line 172
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcTapBottom:I

    sget v1, Lcom/flyersoft/tools/A;->doTapScreenBottom:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(II)V

    .line 173
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcTapLeft:I

    sget v1, Lcom/flyersoft/tools/A;->doTapScreenLeft:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(II)V

    .line 174
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcTapRight:I

    sget v1, Lcom/flyersoft/tools/A;->doTapScreenRight:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(II)V

    .line 175
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->setTapZoneEnable()V

    .line 176
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcTapLong:I

    sget v1, Lcom/flyersoft/tools/A;->doLongTap:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(II)V

    .line 177
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcSwipeLelftToRight:I

    sget v1, Lcom/flyersoft/tools/A;->doSwipeLeftToRight:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(II)V

    .line 178
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcSwipeRightToLeft:I

    sget v1, Lcom/flyersoft/tools/A;->doSwipeRightToLeft:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(II)V

    .line 179
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcSwipeTopToBottom:I

    sget v1, Lcom/flyersoft/tools/A;->doSwipeTopToBottom:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(II)V

    .line 180
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcSwipeBottomToTop:I

    sget v1, Lcom/flyersoft/tools/A;->doSwipeBottomToTop:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(II)V

    .line 181
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcVolumeUp:I

    sget v1, Lcom/flyersoft/tools/A;->doVolumeKeyUp:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(II)V

    .line 182
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcVolumeDown:I

    sget v1, Lcom/flyersoft/tools/A;->doVolumeKeyDown:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(II)V

    .line 183
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcDPadCenter:I

    sget v1, Lcom/flyersoft/tools/A;->doDPadCenter:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(II)V

    .line 184
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcDPadUp:I

    sget v1, Lcom/flyersoft/tools/A;->doDPadUp:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(II)V

    .line 185
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcDPadDown:I

    sget v1, Lcom/flyersoft/tools/A;->doDPadDown:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(II)V

    .line 186
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcDPadLeft:I

    sget v1, Lcom/flyersoft/tools/A;->doDPadLeft:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(II)V

    .line 187
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcDPadRight:I

    sget v1, Lcom/flyersoft/tools/A;->doDPadRight:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(II)V

    .line 188
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcSearchKey:I

    sget v1, Lcom/flyersoft/tools/A;->doSearchKey:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(II)V

    .line 189
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcMenuKey:I

    sget v1, Lcom/flyersoft/tools/A;->doMenuKey:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(II)V

    .line 190
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcBackKey:I

    sget v1, Lcom/flyersoft/tools/A;->doBackKey:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(II)V

    .line 191
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcCameraKey:I

    sget v1, Lcom/flyersoft/tools/A;->doCameraKey:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(II)V

    .line 192
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcHeadsetKey:I

    sget v1, Lcom/flyersoft/tools/A;->doHeadsetKey:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(II)V

    .line 193
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcMediaPause:I

    sget v1, Lcom/flyersoft/tools/A;->doMediaPlayPause:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(II)V

    .line 194
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcMediaNext:I

    sget v1, Lcom/flyersoft/tools/A;->doMediaPlayNext:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(II)V

    .line 195
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcMediaPrevious:I

    sget v1, Lcom/flyersoft/tools/A;->doMediaPlayPrevious:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(II)V

    .line 196
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->ClickLeft:I

    sget v1, Lcom/flyersoft/tools/A;->statusClickLeft:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(II)V

    .line 197
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->ClickMiddle:I

    sget v1, Lcom/flyersoft/tools/A;->statusClickMiddle:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(II)V

    .line 198
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->ClickRight:I

    sget v1, Lcom/flyersoft/tools/A;->statusClickRight:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(II)V

    .line 199
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->ClickLeft2:I

    sget v1, Lcom/flyersoft/tools/A;->statusClickLeft2:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(II)V

    .line 200
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->ClickMiddle2:I

    sget v1, Lcom/flyersoft/tools/A;->statusClickMiddle2:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(II)V

    .line 201
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->ClickRight2:I

    sget v1, Lcom/flyersoft/tools/A;->statusClickRight2:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(II)V

    .line 203
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->syncMediaPlayPauseKeys()V

    return-void
.end method

.method private saveKeycodeList()V
    .locals 5

    .line 554
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "keycode_event"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 555
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    .line 556
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefControl;->kLay:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    if-ge v2, v1, :cond_0

    .line 557
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefControl;->kLay:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->sp:I

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Spinner;

    .line 558
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, ""

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Landroid/widget/Spinner;->getTag()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0xf

    invoke-direct {p0, v1, v4}, Lcom/flyersoft/moonreaderp/PrefControl;->getAction(Landroid/widget/Spinner;I)I

    move-result v1

    invoke-interface {v0, v3, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 560
    :cond_0
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method private setNineGridEvents()V
    .locals 14

    .line 607
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$layout;->nine_grid:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 609
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->sp1:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Landroid/widget/Spinner;

    .line 610
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->sp2:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Landroid/widget/Spinner;

    .line 611
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->sp3:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Landroid/widget/Spinner;

    .line 612
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->sp4:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Landroid/widget/Spinner;

    .line 613
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->sp5:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Landroid/widget/Spinner;

    .line 614
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->sp6:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v9, v1

    check-cast v9, Landroid/widget/Spinner;

    .line 615
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->sp7:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v10, v1

    check-cast v10, Landroid/widget/Spinner;

    .line 616
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->sp8:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v11, v1

    check-cast v11, Landroid/widget/Spinner;

    .line 617
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->sp9:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v12, v1

    check-cast v12, Landroid/widget/Spinner;

    const/4 v1, 0x4

    .line 619
    invoke-virtual {v8, v1}, Landroid/widget/Spinner;->setVisibility(I)V

    .line 620
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->middle:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/moonreaderp/PrefControl;->getActionItems(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xf

    aget-object v2, v2, v3

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 622
    new-instance v1, Lcom/flyersoft/moonreaderp/PrefControl$15;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/flyersoft/moonreaderp/PrefControl;->getActionItems(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v3

    const v13, 0x1090008

    invoke-direct {v1, p0, v2, v13, v3}, Lcom/flyersoft/moonreaderp/PrefControl$15;-><init>(Lcom/flyersoft/moonreaderp/PrefControl;Landroid/content/Context;I[Ljava/lang/String;)V

    .line 632
    invoke-virtual {v4, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 633
    invoke-virtual {v5, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 634
    invoke-virtual {v6, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 635
    invoke-virtual {v7, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 636
    invoke-virtual {v8, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 637
    invoke-virtual {v9, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 638
    invoke-virtual {v10, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 639
    invoke-virtual {v11, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 640
    invoke-virtual {v12, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 642
    sget v1, Lcom/flyersoft/tools/A;->do91:I

    invoke-direct {p0, v4, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(Landroid/widget/Spinner;I)V

    .line 643
    sget v1, Lcom/flyersoft/tools/A;->do92:I

    invoke-direct {p0, v5, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(Landroid/widget/Spinner;I)V

    .line 644
    sget v1, Lcom/flyersoft/tools/A;->do93:I

    invoke-direct {p0, v6, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(Landroid/widget/Spinner;I)V

    .line 645
    sget v1, Lcom/flyersoft/tools/A;->do94:I

    invoke-direct {p0, v7, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(Landroid/widget/Spinner;I)V

    .line 646
    sget v1, Lcom/flyersoft/tools/A;->do95:I

    invoke-direct {p0, v8, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(Landroid/widget/Spinner;I)V

    .line 647
    sget v1, Lcom/flyersoft/tools/A;->do96:I

    invoke-direct {p0, v9, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(Landroid/widget/Spinner;I)V

    .line 648
    sget v1, Lcom/flyersoft/tools/A;->do97:I

    invoke-direct {p0, v10, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(Landroid/widget/Spinner;I)V

    .line 649
    sget v1, Lcom/flyersoft/tools/A;->do98:I

    invoke-direct {p0, v11, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(Landroid/widget/Spinner;I)V

    .line 650
    sget v1, Lcom/flyersoft/tools/A;->do99:I

    invoke-direct {p0, v12, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(Landroid/widget/Spinner;I)V

    const/4 v1, 0x1

    .line 652
    invoke-static {v0, v1}, Lcom/flyersoft/tools/A;->checkNightDialogState(Landroid/view/View;Z)Z

    .line 653
    new-instance v1, Landroid/app/Dialog;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v2

    sget-boolean v3, Lcom/flyersoft/tools/A;->eink:Z

    if-eqz v3, :cond_0

    sget v3, Lcom/flyersoft/moonreaderp/R$style;->dialog_fullscreen_ink:I

    goto :goto_0

    :cond_0
    sget v3, Lcom/flyersoft/moonreaderp/R$style;->dialog_fullscreen:I

    :goto_0
    invoke-direct {v1, v2, v3}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 654
    invoke-virtual {v1, v0}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 655
    invoke-virtual {v1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v2

    const/4 v3, -0x1

    .line 656
    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 657
    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 658
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 659
    invoke-static {v1}, Lcom/flyersoft/tools/A;->forceDialogImmersiveMode(Landroid/app/Dialog;)V

    .line 661
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->closeIv:I

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 662
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v2

    if-eqz v2, :cond_1

    sget v2, Lcom/flyersoft/moonreaderp/R$drawable;->close_light2:I

    goto :goto_1

    :cond_1
    sget v2, Lcom/flyersoft/moonreaderp/R$drawable;->close_dark2:I

    :goto_1
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 663
    new-instance v2, Lcom/flyersoft/moonreaderp/PrefControl$16;

    invoke-direct {v2, p0, v1}, Lcom/flyersoft/moonreaderp/PrefControl$16;-><init>(Lcom/flyersoft/moonreaderp/PrefControl;Landroid/app/Dialog;)V

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 670
    new-instance v2, Lcom/flyersoft/moonreaderp/PrefControl$17;

    move-object v3, p0

    invoke-direct/range {v2 .. v12}, Lcom/flyersoft/moonreaderp/PrefControl$17;-><init>(Lcom/flyersoft/moonreaderp/PrefControl;Landroid/widget/Spinner;Landroid/widget/Spinner;Landroid/widget/Spinner;Landroid/widget/Spinner;Landroid/widget/Spinner;Landroid/widget/Spinner;Landroid/widget/Spinner;Landroid/widget/Spinner;Landroid/widget/Spinner;)V

    invoke-virtual {v1, v2}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 685
    invoke-virtual {v1}, Landroid/app/Dialog;->show()V

    return-void
.end method

.method private setNineGridText()V
    .locals 5

    .line 589
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->nine_grid_event:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 591
    :try_start_0
    sget v1, Lcom/flyersoft/tools/A;->do91:I

    const/16 v2, 0xf

    if-eq v1, v2, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\n1: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/flyersoft/moonreaderp/PrefControl;->getActionItems(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v3

    sget v4, Lcom/flyersoft/tools/A;->do91:I

    aget-object v3, v3, v4

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 592
    :cond_0
    sget v1, Lcom/flyersoft/tools/A;->do92:I

    if-eq v1, v2, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\n2: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/flyersoft/moonreaderp/PrefControl;->getActionItems(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v3

    sget v4, Lcom/flyersoft/tools/A;->do92:I

    aget-object v3, v3, v4

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 593
    :cond_1
    sget v1, Lcom/flyersoft/tools/A;->do93:I

    if-eq v1, v2, :cond_2

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\n3: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/flyersoft/moonreaderp/PrefControl;->getActionItems(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v3

    sget v4, Lcom/flyersoft/tools/A;->do93:I

    aget-object v3, v3, v4

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 594
    :cond_2
    sget v1, Lcom/flyersoft/tools/A;->do94:I

    if-eq v1, v2, :cond_3

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\n4: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/flyersoft/moonreaderp/PrefControl;->getActionItems(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v3

    sget v4, Lcom/flyersoft/tools/A;->do94:I

    aget-object v3, v3, v4

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 595
    :cond_3
    sget v1, Lcom/flyersoft/tools/A;->do95:I

    if-eq v1, v2, :cond_4

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\n5: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/flyersoft/moonreaderp/PrefControl;->getActionItems(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v3

    sget v4, Lcom/flyersoft/tools/A;->do95:I

    aget-object v3, v3, v4

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 596
    :cond_4
    sget v1, Lcom/flyersoft/tools/A;->do96:I

    if-eq v1, v2, :cond_5

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\n6: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/flyersoft/moonreaderp/PrefControl;->getActionItems(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v3

    sget v4, Lcom/flyersoft/tools/A;->do96:I

    aget-object v3, v3, v4

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 597
    :cond_5
    sget v1, Lcom/flyersoft/tools/A;->do97:I

    if-eq v1, v2, :cond_6

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\n7: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/flyersoft/moonreaderp/PrefControl;->getActionItems(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v3

    sget v4, Lcom/flyersoft/tools/A;->do97:I

    aget-object v3, v3, v4

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 598
    :cond_6
    sget v1, Lcom/flyersoft/tools/A;->do98:I

    if-eq v1, v2, :cond_7

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\n8: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/flyersoft/moonreaderp/PrefControl;->getActionItems(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v3

    sget v4, Lcom/flyersoft/tools/A;->do98:I

    aget-object v3, v3, v4

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 599
    :cond_7
    sget v1, Lcom/flyersoft/tools/A;->do99:I

    if-eq v1, v2, :cond_8

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\n9: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/moonreaderp/PrefControl;->getActionItems(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v2

    sget v3, Lcom/flyersoft/tools/A;->do99:I

    aget-object v2, v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v1

    .line 601
    invoke-static {v1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 603
    :cond_8
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefControl;->nine_grid:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private setScreenOrientation()V
    .locals 5

    .line 236
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pcScreen:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    .line 237
    new-instance v1, Landroid/widget/ArrayAdapter;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v2

    .line 239
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Lcom/flyersoft/moonreaderp/R$array;->ScreenOrientation2:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v3

    const v4, 0x1090008

    invoke-direct {v1, v2, v4, v3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    const v2, 0x1090009

    .line 240
    invoke-virtual {v1, v2}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 241
    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 243
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pcScreen:I

    sget v2, Lcom/flyersoft/tools/A;->screenState:I

    invoke-direct {p0, v1, v2}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(II)V

    .line 244
    new-instance v1, Lcom/flyersoft/moonreaderp/PrefControl$7;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefControl$7;-><init>(Lcom/flyersoft/moonreaderp/PrefControl;)V

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    return-void
.end method

.method private setSelection(II)V
    .locals 1

    .line 261
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->root:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Spinner;

    .line 262
    invoke-direct {p0, p1, p2}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(Landroid/widget/Spinner;I)V

    return-void
.end method

.method private setSelection(Landroid/widget/Spinner;I)V
    .locals 1

    .line 266
    invoke-virtual {p1}, Landroid/widget/Spinner;->getCount()I

    move-result v0

    if-lt p2, v0, :cond_0

    const/16 p2, 0xf

    .line 268
    :cond_0
    invoke-virtual {p1, p2}, Landroid/widget/Spinner;->setSelection(I)V

    return-void
.end method

.method private setShakeSensitive()V
    .locals 5

    .line 433
    new-instance v0, Landroid/widget/SeekBar;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    const/16 v1, 0x5a

    .line 434
    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setMax(I)V

    .line 435
    sget v1, Lcom/flyersoft/tools/A;->shake_sensitive:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "A.shake_sensitive 1"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const/4 v3, 0x1

    aput-object v1, v2, v3

    invoke-static {v2}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 436
    sget v1, Lcom/flyersoft/tools/A;->shake_sensitive:F

    const/high16 v2, 0x41200000    # 10.0f

    cmpl-float v1, v1, v2

    if-lez v1, :cond_0

    .line 437
    sput v2, Lcom/flyersoft/tools/A;->shake_sensitive:F

    .line 438
    :cond_0
    sget v1, Lcom/flyersoft/tools/A;->shake_sensitive:F

    const/high16 v4, 0x3f800000    # 1.0f

    cmpg-float v1, v1, v4

    if-gez v1, :cond_1

    .line 439
    sput v4, Lcom/flyersoft/tools/A;->shake_sensitive:F

    .line 440
    :cond_1
    invoke-virtual {v0}, Landroid/widget/SeekBar;->getMax()I

    move-result v1

    sget v4, Lcom/flyersoft/tools/A;->shake_sensitive:F

    mul-float v4, v4, v2

    float-to-int v2, v4

    sub-int/2addr v1, v2

    add-int/lit8 v1, v1, 0xa

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 441
    new-instance v1, Lcom/flyersoft/moonreaderp/PrefControl$10;

    invoke-direct {v1, p0, v0}, Lcom/flyersoft/moonreaderp/PrefControl$10;-><init>(Lcom/flyersoft/moonreaderp/PrefControl;Landroid/widget/SeekBar;)V

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 454
    new-instance v1, Lcom/flyersoft/components/MyDialog;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->tilt_sensitive:I

    invoke-virtual {v1, v2}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v1

    .line 455
    invoke-virtual {v1, v0}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/flyersoft/components/MyDialog;->setCancelable(Z)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method

.method public static setSpinnerList(Landroid/content/Context;Landroid/widget/Spinner;)V
    .locals 3

    .line 273
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefControl;->actionAdapter:Landroid/widget/ArrayAdapter;

    if-nez v0, :cond_0

    .line 274
    new-instance v0, Landroid/widget/ArrayAdapter;

    const v1, 0x1090008

    .line 275
    invoke-static {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getActionItems(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, p0, v1, v2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    sput-object v0, Lcom/flyersoft/moonreaderp/PrefControl;->actionAdapter:Landroid/widget/ArrayAdapter;

    .line 278
    :cond_0
    sget-object p0, Lcom/flyersoft/moonreaderp/PrefControl;->actionAdapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {p1, p0}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    return-void
.end method

.method private showKecodeMapping()V
    .locals 7

    .line 468
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$layout;->keycode:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 469
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->tv:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 470
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->sp:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Spinner;

    .line 471
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4, v3}, Lcom/flyersoft/moonreaderp/PrefControl;->setSpinnerList(Landroid/content/Context;Landroid/widget/Spinner;)V

    const/16 v4, 0xf

    .line 472
    invoke-direct {p0, v3, v4}, Lcom/flyersoft/moonreaderp/PrefControl;->setSelection(Landroid/widget/Spinner;I)V

    .line 474
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/flyersoft/tools/A;->alertDialog(Landroid/content/Context;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object v4

    .line 475
    sget v5, Lcom/flyersoft/moonreaderp/R$string;->key_press_tip:I

    invoke-virtual {v4, v5}, Landroidx/appcompat/app/AlertDialog$Builder;->setTitle(I)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object v5

    .line 476
    invoke-virtual {v5, v0}, Landroidx/appcompat/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object v5

    new-instance v6, Lcom/flyersoft/moonreaderp/PrefControl$11;

    invoke-direct {v6, p0, v1, v3}, Lcom/flyersoft/moonreaderp/PrefControl$11;-><init>(Lcom/flyersoft/moonreaderp/PrefControl;Landroid/widget/TextView;Landroid/widget/Spinner;)V

    const v3, 0x104000a

    invoke-virtual {v5, v3, v6}, Landroidx/appcompat/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object v3

    const/high16 v5, 0x1040000

    .line 484
    invoke-virtual {v3, v5, v2}, Landroidx/appcompat/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object v2

    const/4 v3, 0x0

    .line 485
    invoke-virtual {v2, v3}, Landroidx/appcompat/app/AlertDialog$Builder;->setCancelable(Z)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 486
    new-instance v2, Lcom/flyersoft/moonreaderp/PrefControl$12;

    invoke-direct {v2, p0, v1}, Lcom/flyersoft/moonreaderp/PrefControl$12;-><init>(Lcom/flyersoft/moonreaderp/PrefControl;Landroid/widget/TextView;)V

    invoke-virtual {v4, v2}, Landroidx/appcompat/app/AlertDialog$Builder;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 495
    invoke-static {v0}, Lcom/flyersoft/tools/A;->checkNightDialogState(Landroid/view/View;)Z

    .line 496
    invoke-virtual {v4}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object v0

    .line 498
    invoke-static {v0}, Lcom/flyersoft/components/MyDialog;->setDialogDynamicBackground(Landroid/app/Dialog;)V

    .line 499
    invoke-static {v0}, Lcom/flyersoft/components/MyDialog;->setDialogButtonDynamicColor(Landroidx/appcompat/app/AlertDialog;)V

    .line 500
    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog;->show()V

    return-void
.end method

.method private syncMediaPlayPauseKeys()V
    .locals 4

    .line 207
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefControl$6;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/flyersoft/moonreaderp/PrefControl$6;-><init>(Lcom/flyersoft/moonreaderp/PrefControl;Landroid/os/Looper;)V

    const/4 v1, 0x0

    const-wide/16 v2, 0x3e8

    .line 232
    invoke-virtual {v0, v1, v2, v3}, Lcom/flyersoft/moonreaderp/PrefControl$6;->sendEmptyMessageDelayed(IJ)Z

    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 2

    .line 308
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->forFuncSearch:Z

    if-eqz v0, :cond_0

    .line 309
    invoke-super {p0}, Lcom/flyersoft/moonreaderp/PrefOptions;->dismiss()V

    return-void

    .line 312
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->sv:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getScrollY()I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->prefcp:I

    .line 313
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->saveKeycodeList()V

    .line 314
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcScreen:I

    sget v1, Lcom/flyersoft/tools/A;->screenState:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->getAction(II)I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->screenState:I

    .line 315
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcShake:I

    sget v1, Lcom/flyersoft/tools/A;->doShakePhone:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->getAction(II)I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->doShakePhone:I

    .line 316
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcTapTop:I

    sget v1, Lcom/flyersoft/tools/A;->doTapScreenTop:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->getAction(II)I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->doTapScreenTop:I

    .line 317
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcTapBottom:I

    sget v1, Lcom/flyersoft/tools/A;->doTapScreenBottom:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->getAction(II)I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->doTapScreenBottom:I

    .line 318
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcTapLeft:I

    sget v1, Lcom/flyersoft/tools/A;->doTapScreenLeft:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->getAction(II)I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->doTapScreenLeft:I

    .line 319
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcTapRight:I

    sget v1, Lcom/flyersoft/tools/A;->doTapScreenRight:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->getAction(II)I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->doTapScreenRight:I

    .line 320
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcSwipeLelftToRight:I

    sget v1, Lcom/flyersoft/tools/A;->doSwipeLeftToRight:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->getAction(II)I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->doSwipeLeftToRight:I

    .line 321
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcSwipeRightToLeft:I

    sget v1, Lcom/flyersoft/tools/A;->doSwipeRightToLeft:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->getAction(II)I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->doSwipeRightToLeft:I

    .line 322
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcSwipeTopToBottom:I

    sget v1, Lcom/flyersoft/tools/A;->doSwipeTopToBottom:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->getAction(II)I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->doSwipeTopToBottom:I

    .line 323
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcSwipeBottomToTop:I

    sget v1, Lcom/flyersoft/tools/A;->doSwipeBottomToTop:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->getAction(II)I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->doSwipeBottomToTop:I

    .line 324
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcVolumeUp:I

    sget v1, Lcom/flyersoft/tools/A;->doVolumeKeyUp:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->getAction(II)I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->doVolumeKeyUp:I

    .line 325
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcVolumeDown:I

    sget v1, Lcom/flyersoft/tools/A;->doVolumeKeyDown:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->getAction(II)I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->doVolumeKeyDown:I

    .line 326
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcDPadUp:I

    sget v1, Lcom/flyersoft/tools/A;->doDPadUp:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->getAction(II)I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->doDPadUp:I

    .line 327
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcDPadDown:I

    sget v1, Lcom/flyersoft/tools/A;->doDPadDown:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->getAction(II)I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->doDPadDown:I

    .line 328
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcDPadLeft:I

    sget v1, Lcom/flyersoft/tools/A;->doDPadLeft:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->getAction(II)I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->doDPadLeft:I

    .line 329
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcDPadRight:I

    sget v1, Lcom/flyersoft/tools/A;->doDPadRight:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->getAction(II)I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->doDPadRight:I

    .line 330
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcDPadCenter:I

    sget v1, Lcom/flyersoft/tools/A;->doDPadCenter:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->getAction(II)I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->doDPadCenter:I

    .line 331
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcBackKey:I

    sget v1, Lcom/flyersoft/tools/A;->doBackKey:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->getAction(II)I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->doBackKey:I

    .line 332
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcSearchKey:I

    sget v1, Lcom/flyersoft/tools/A;->doSearchKey:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->getAction(II)I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->doSearchKey:I

    .line 333
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcMenuKey:I

    sget v1, Lcom/flyersoft/tools/A;->doMenuKey:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->getAction(II)I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->doMenuKey:I

    .line 334
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcCameraKey:I

    sget v1, Lcom/flyersoft/tools/A;->doCameraKey:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->getAction(II)I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->doCameraKey:I

    .line 335
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcHeadsetKey:I

    sget v1, Lcom/flyersoft/tools/A;->doHeadsetKey:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->getAction(II)I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->doHeadsetKey:I

    .line 336
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcMediaPause:I

    sget v1, Lcom/flyersoft/tools/A;->doMediaPlayPause:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->getAction(II)I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->doMediaPlayPause:I

    .line 337
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcMediaNext:I

    sget v1, Lcom/flyersoft/tools/A;->doMediaPlayNext:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->getAction(II)I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->doMediaPlayNext:I

    .line 338
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcMediaPrevious:I

    sget v1, Lcom/flyersoft/tools/A;->doMediaPlayPrevious:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->getAction(II)I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->doMediaPlayPrevious:I

    .line 339
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcTapLong:I

    sget v1, Lcom/flyersoft/tools/A;->doLongTap:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->getAction(II)I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->doLongTap:I

    .line 340
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->leftSp:Landroid/widget/Spinner;

    sget v1, Lcom/flyersoft/tools/A;->statusClickLeft:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->getAction(Landroid/widget/Spinner;I)I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->statusClickLeft:I

    .line 341
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->middleSp:Landroid/widget/Spinner;

    sget v1, Lcom/flyersoft/tools/A;->statusClickMiddle:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->getAction(Landroid/widget/Spinner;I)I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->statusClickMiddle:I

    .line 342
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->rightSp:Landroid/widget/Spinner;

    sget v1, Lcom/flyersoft/tools/A;->statusClickRight:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->getAction(Landroid/widget/Spinner;I)I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->statusClickRight:I

    .line 343
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->leftSp2:Landroid/widget/Spinner;

    sget v1, Lcom/flyersoft/tools/A;->statusClickLeft2:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->getAction(Landroid/widget/Spinner;I)I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->statusClickLeft2:I

    .line 344
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->middleSp2:Landroid/widget/Spinner;

    sget v1, Lcom/flyersoft/tools/A;->statusClickMiddle2:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->getAction(Landroid/widget/Spinner;I)I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->statusClickMiddle2:I

    .line 345
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->rightSp2:Landroid/widget/Spinner;

    sget v1, Lcom/flyersoft/tools/A;->statusClickRight2:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->getAction(Landroid/widget/Spinner;I)I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->statusClickRight2:I

    .line 346
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 347
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->setStatusBarClickable()V

    .line 349
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->res:Landroid/content/Context;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->SaveOptions(Landroid/content/Context;)V

    const/4 v0, 0x0

    .line 350
    sput-object v0, Lcom/flyersoft/moonreaderp/PrefControl;->selfPref:Lcom/flyersoft/moonreaderp/PrefControl;

    .line 351
    invoke-super {p0}, Lcom/flyersoft/moonreaderp/PrefOptions;->dismiss()V

    return-void
.end method

.method getKeycodeNames()Ljava/util/HashMap;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 505
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->keycodeNames:Ljava/util/HashMap;

    if-nez v0, :cond_1

    .line 506
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->keycodeNames:Ljava/util/HashMap;

    .line 508
    :try_start_0
    const-class v0, Landroid/view/KeyEvent;

    invoke-virtual {v0}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 509
    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v4

    .line 510
    const-string v5, "KEYCODE_"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    instance-of v6, v6, Ljava/lang/Integer;

    if-eqz v6, :cond_0

    .line 511
    invoke-virtual {v3, v5}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    const/16 v5, 0x8

    .line 512
    invoke-virtual {v4, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    const-string v5, "_"

    const-string v6, " "

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    .line 513
    invoke-static {v4}, Lcom/flyersoft/tools/T;->capitalizeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 514
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefControl;->keycodeNames:Ljava/util/HashMap;

    invoke-virtual {v5, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 518
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 521
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->keycodeNames:Ljava/util/HashMap;

    return-object v0
.end method

.method public initView()V
    .locals 5

    .line 73
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->forFuncSearch:Z

    if-nez v0, :cond_0

    .line 74
    sput-object p0, Lcom/flyersoft/moonreaderp/PrefControl;->selfPref:Lcom/flyersoft/moonreaderp/PrefControl;

    .line 75
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->settingButton1:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->b1:Landroid/widget/Button;

    .line 76
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->settingButton2:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->b2:Landroid/widget/Button;

    .line 77
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->keycodeLay:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->kLay:Landroid/widget/LinearLayout;

    .line 78
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->b1:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 79
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->b2:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 80
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->ClickLeft:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->leftSp:Landroid/widget/Spinner;

    .line 81
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->ClickMiddle:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->middleSp:Landroid/widget/Spinner;

    .line 82
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->ClickRight:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->rightSp:Landroid/widget/Spinner;

    .line 83
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->ClickLeft2:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->leftSp2:Landroid/widget/Spinner;

    .line 84
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->ClickMiddle2:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->middleSp2:Landroid/widget/Spinner;

    .line 85
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->ClickRight2:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->rightSp2:Landroid/widget/Spinner;

    .line 86
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pcReset:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 87
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->setShake:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 88
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->setTapMode:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 89
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->setLongTap:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 91
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->keycodeB2:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 93
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->misc_fling_tip:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->fling_tip:Landroid/widget/TextView;

    .line 94
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->misc_vscroll_tip:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->vscroll_tip:Landroid/widget/TextView;

    .line 95
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->misc_statusbar_tip:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->statusbar_tip:Landroid/widget/TextView;

    .line 96
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->nineGrid:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->nine_grid:Landroid/widget/TextView;

    .line 97
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->fling_tip:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->more:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->allow_scroll_horizontally:I

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 98
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->vscroll_tip:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->more:I

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->disablemove:I

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 99
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->statusbar_tip:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->more:I

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->status_bar:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 100
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->fling_tip:Landroid/widget/TextView;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefControl$1;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefControl$1;-><init>(Lcom/flyersoft/moonreaderp/PrefControl;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 105
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->vscroll_tip:Landroid/widget/TextView;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefControl$2;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefControl$2;-><init>(Lcom/flyersoft/moonreaderp/PrefControl;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 110
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->statusbar_tip:Landroid/widget/TextView;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefControl$3;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefControl$3;-><init>(Lcom/flyersoft/moonreaderp/PrefControl;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 115
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->setNineGridText()V

    .line 116
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->nine_grid:Landroid/widget/TextView;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefControl$4;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefControl$4;-><init>(Lcom/flyersoft/moonreaderp/PrefControl;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 123
    invoke-static {}, Lcom/flyersoft/tools/A;->isPro()Z

    move-result v0

    if-nez v0, :cond_1

    .line 124
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pcHeadsetLay:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    const/4 v0, 0x0

    .line 126
    sput-object v0, Lcom/flyersoft/moonreaderp/PrefControl;->actionAdapter:Landroid/widget/ArrayAdapter;

    .line 127
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->root:Landroid/view/View;

    check-cast v0, Landroid/view/ViewGroup;

    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/PrefControl;->initActionList(Landroid/view/ViewGroup;)V

    .line 128
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->loadOptions()V

    .line 129
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->createKeycodeListView()V

    .line 130
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->initGallery()V

    .line 132
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->forFuncSearch:Z

    if-nez v0, :cond_2

    sget v0, Lcom/flyersoft/tools/A;->prefcp:I

    if-lez v0, :cond_2

    .line 133
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->root:Landroid/view/View;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefControl$5;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefControl$5;-><init>(Lcom/flyersoft/moonreaderp/PrefControl;)V

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_2
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 7

    .line 365
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->keycodeB2:I

    if-ne v0, v1, :cond_0

    .line 366
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->showKecodeMapping()V

    .line 369
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pcReset:I

    const/4 v2, 0x0

    const/high16 v3, 0x1040000

    const v4, 0x104000a

    if-ne v0, v1, :cond_1

    .line 370
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->confirmation:I

    .line 371
    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 372
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v5

    sget v6, Lcom/flyersoft/moonreaderp/R$string;->reset:I

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/flyersoft/tools/T;->deleteQuotes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " \""

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 373
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v5

    sget v6, Lcom/flyersoft/moonreaderp/R$string;->control_options:I

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "\"?"

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 372
    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefControl$8;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefControl$8;-><init>(Lcom/flyersoft/moonreaderp/PrefControl;)V

    .line 374
    invoke-virtual {v0, v4, v1}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 383
    invoke-virtual {v0, v3, v2}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    .line 386
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->setShake:I

    if-ne v0, v1, :cond_2

    .line 387
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->setShakeSensitive()V

    .line 390
    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->setTapMode:I

    if-ne v0, v1, :cond_4

    .line 391
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 392
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->initClickTip(Z)Z

    goto :goto_0

    .line 394
    :cond_3
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v5

    const-class v6, Lcom/flyersoft/moonreaderp/ClickTip;

    invoke-direct {v1, v5, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 397
    :cond_4
    :goto_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->setLongTap:I

    if-ne v0, v1, :cond_5

    .line 398
    new-instance v0, Landroid/widget/EditText;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    const/16 v1, 0x2000

    .line 399
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setInputType(I)V

    .line 400
    new-instance v1, Ljava/text/DecimalFormat;

    const-string v5, "0.00"

    invoke-direct {v1, v5}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    sget v5, Lcom/flyersoft/tools/A;->longTapInterval:F

    float-to-double v5, v5

    invoke-virtual {v1, v5, v6}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 401
    new-instance v1, Lcom/flyersoft/components/MyDialog;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v1, v5}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->long_tap_interval:I

    .line 402
    invoke-virtual {v1, v5}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v1

    new-instance v5, Lcom/flyersoft/moonreaderp/PrefControl$9;

    invoke-direct {v5, p0, v0}, Lcom/flyersoft/moonreaderp/PrefControl$9;-><init>(Lcom/flyersoft/moonreaderp/PrefControl;Landroid/widget/EditText;)V

    .line 403
    invoke-virtual {v1, v4, v5}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 413
    invoke-virtual {v0, v3, v2}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    .line 416
    :cond_5
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->b1:Landroid/widget/Button;

    if-ne p1, v0, :cond_7

    .line 417
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->cancel()V

    .line 418
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_6

    .line 419
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showVisualOptions()V

    goto :goto_1

    .line 421
    :cond_6
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flyersoft/moonreaderp/PrefVisual;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->show()V

    .line 423
    :cond_7
    :goto_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->b2:Landroid/widget/Button;

    if-ne p1, v0, :cond_9

    .line 424
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->cancel()V

    .line 425
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p1

    if-nez p1, :cond_8

    .line 426
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showMiscOptions()V

    return-void

    .line 428
    :cond_8
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefMisc;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/flyersoft/moonreaderp/PrefMisc;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefMisc;->show()V

    :cond_9
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 57
    invoke-super {p0, p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->onCreate(Landroid/os/Bundle;)V

    .line 58
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->initView()V

    .line 59
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->initParams()Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const v0, 0x3f4ccccd    # 0.8f

    .line 60
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setDim(F)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/4 v0, -0x1

    .line 61
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setHeight(I)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/4 v0, 0x1

    .line 62
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setFullscreen(Z)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    .line 63
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->control_options:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setDialogTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/4 v0, 0x0

    .line 64
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setFuncSearchVisible(I)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    .line 65
    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->done()V

    return-void
.end method

.method public setTapZoneEnable()V
    .locals 4

    .line 463
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->hlay:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    sget-boolean v1, Lcom/flyersoft/tools/A;->toggleTapMode:Z

    const/4 v2, 0x0

    const/16 v3, 0x8

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    const/16 v1, 0x8

    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 464
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->vlay:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    sget-boolean v1, Lcom/flyersoft/tools/A;->toggleTapMode:Z

    if-nez v1, :cond_1

    goto :goto_1

    :cond_1
    const/16 v2, 0x8

    :goto_1
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method
