.class Lcom/flyersoft/components/DragSort/SelectBar$2;
.super Ljava/lang/Object;
.source "SelectBar.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/DragSort/SelectBar;->customizeSelectBar(Landroid/content/Context;Lcom/flyersoft/moonreaderp/ActivityTxt;ZZ)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$act:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$buttons:Ljava/util/ArrayList;

.field final synthetic val$cb:Landroid/widget/CheckBox;

.field final synthetic val$cb2:Landroid/widget/CheckBox;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$dest_sp:Landroid/widget/Spinner;

.field final synthetic val$dict_sp:Landroid/widget/Spinner;

.field final synthetic val$dict_sp2:Landroid/widget/Spinner;

.field final synthetic val$hasCode:I

.field final synthetic val$items:[Ljava/lang/CharSequence;

.field final synthetic val$showMenu:Z

.field final synthetic val$source_sp:Landroid/widget/Spinner;


# direct methods
.method constructor <init>(Ljava/util/ArrayList;Landroid/widget/Spinner;Landroid/widget/Spinner;Landroid/widget/Spinner;[Ljava/lang/CharSequence;Landroid/widget/Spinner;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/content/Context;Lcom/flyersoft/moonreaderp/ActivityTxt;IZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 272
    iput-object p1, p0, Lcom/flyersoft/components/DragSort/SelectBar$2;->val$buttons:Ljava/util/ArrayList;

    iput-object p2, p0, Lcom/flyersoft/components/DragSort/SelectBar$2;->val$source_sp:Landroid/widget/Spinner;

    iput-object p3, p0, Lcom/flyersoft/components/DragSort/SelectBar$2;->val$dest_sp:Landroid/widget/Spinner;

    iput-object p4, p0, Lcom/flyersoft/components/DragSort/SelectBar$2;->val$dict_sp:Landroid/widget/Spinner;

    iput-object p5, p0, Lcom/flyersoft/components/DragSort/SelectBar$2;->val$items:[Ljava/lang/CharSequence;

    iput-object p6, p0, Lcom/flyersoft/components/DragSort/SelectBar$2;->val$dict_sp2:Landroid/widget/Spinner;

    iput-object p7, p0, Lcom/flyersoft/components/DragSort/SelectBar$2;->val$cb:Landroid/widget/CheckBox;

    iput-object p8, p0, Lcom/flyersoft/components/DragSort/SelectBar$2;->val$cb2:Landroid/widget/CheckBox;

    iput-object p9, p0, Lcom/flyersoft/components/DragSort/SelectBar$2;->val$context:Landroid/content/Context;

    iput-object p10, p0, Lcom/flyersoft/components/DragSort/SelectBar$2;->val$act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput p11, p0, Lcom/flyersoft/components/DragSort/SelectBar$2;->val$hasCode:I

    iput-boolean p12, p0, Lcom/flyersoft/components/DragSort/SelectBar$2;->val$showMenu:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    .line 274
    iget-object p1, p0, Lcom/flyersoft/components/DragSort/SelectBar$2;->val$buttons:Ljava/util/ArrayList;

    invoke-static {p1}, Lcom/flyersoft/components/DragSort/SelectBar;->saveButtons(Ljava/util/ArrayList;)V

    .line 276
    iget-object p1, p0, Lcom/flyersoft/components/DragSort/SelectBar$2;->val$source_sp:Landroid/widget/Spinner;

    invoke-virtual {p1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result p1

    invoke-static {p1}, Lcom/flyersoft/tools/A;->getTranslationAbbr(I)Ljava/lang/String;

    move-result-object p1

    sput-object p1, Lcom/flyersoft/tools/A;->sourceLanguage:Ljava/lang/String;

    .line 277
    iget-object p1, p0, Lcom/flyersoft/components/DragSort/SelectBar$2;->val$dest_sp:Landroid/widget/Spinner;

    invoke-virtual {p1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result p1

    invoke-static {p1}, Lcom/flyersoft/tools/A;->getTranslationAbbr(I)Ljava/lang/String;

    move-result-object p1

    sput-object p1, Lcom/flyersoft/tools/A;->destLanguage:Ljava/lang/String;

    .line 279
    iget-object p1, p0, Lcom/flyersoft/components/DragSort/SelectBar$2;->val$dict_sp:Landroid/widget/Spinner;

    invoke-virtual {p1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->dict_index:I

    .line 280
    sget p1, Lcom/flyersoft/tools/A;->dict_index:I

    iget-object p2, p0, Lcom/flyersoft/components/DragSort/SelectBar$2;->val$items:[Ljava/lang/CharSequence;

    array-length p2, p2

    const/4 v0, 0x1

    sub-int/2addr p2, v0

    const/4 v1, -0x2

    if-ne p1, p2, :cond_0

    .line 281
    sput v1, Lcom/flyersoft/tools/A;->dict_index:I

    .line 282
    :cond_0
    sget p1, Lcom/flyersoft/tools/A;->dict_index:I

    iget-object p2, p0, Lcom/flyersoft/components/DragSort/SelectBar$2;->val$items:[Ljava/lang/CharSequence;

    array-length p2, p2

    add-int/lit8 p2, p2, -0x2

    const/4 v2, -0x1

    if-ne p1, p2, :cond_1

    .line 283
    sput v2, Lcom/flyersoft/tools/A;->dict_index:I

    .line 284
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/components/DragSort/SelectBar$2;->val$dict_sp2:Landroid/widget/Spinner;

    invoke-virtual {p1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->dict_index2:I

    .line 285
    sget p1, Lcom/flyersoft/tools/A;->dict_index2:I

    iget-object p2, p0, Lcom/flyersoft/components/DragSort/SelectBar$2;->val$items:[Ljava/lang/CharSequence;

    array-length p2, p2

    sub-int/2addr p2, v0

    if-ne p1, p2, :cond_2

    .line 286
    sput v1, Lcom/flyersoft/tools/A;->dict_index2:I

    .line 287
    :cond_2
    sget p1, Lcom/flyersoft/tools/A;->dict_index2:I

    iget-object p2, p0, Lcom/flyersoft/components/DragSort/SelectBar$2;->val$items:[Ljava/lang/CharSequence;

    array-length p2, p2

    add-int/lit8 p2, p2, -0x2

    if-ne p1, p2, :cond_3

    .line 288
    sput v2, Lcom/flyersoft/tools/A;->dict_index2:I

    .line 290
    :cond_3
    iget-object p1, p0, Lcom/flyersoft/components/DragSort/SelectBar$2;->val$cb:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->openDictDirect:Z

    .line 291
    iget-object p1, p0, Lcom/flyersoft/components/DragSort/SelectBar$2;->val$cb2:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->oneCharDict:Z

    .line 292
    sget-boolean p1, Lcom/flyersoft/tools/A;->translateInited:Z

    if-nez p1, :cond_4

    .line 293
    sput-boolean v0, Lcom/flyersoft/tools/A;->translateInited:Z

    .line 294
    iget-object p1, p0, Lcom/flyersoft/components/DragSort/SelectBar$2;->val$context:Landroid/content/Context;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->SaveOptions(Landroid/content/Context;)V

    .line 296
    :cond_4
    iget-object p1, p0, Lcom/flyersoft/components/DragSort/SelectBar$2;->val$act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    if-eqz p1, :cond_6

    .line 297
    iget p1, p0, Lcom/flyersoft/components/DragSort/SelectBar$2;->val$hasCode:I

    iget-object p2, p0, Lcom/flyersoft/components/DragSort/SelectBar$2;->val$buttons:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->hashCode()I

    move-result p2

    if-eq p1, p2, :cond_5

    .line 298
    iget-object p1, p0, Lcom/flyersoft/components/DragSort/SelectBar$2;->val$act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->hideDotViews()Z

    return-void

    .line 299
    :cond_5
    iget-boolean p1, p0, Lcom/flyersoft/components/DragSort/SelectBar$2;->val$showMenu:Z

    if-eqz p1, :cond_6

    .line 300
    iget-object p1, p0, Lcom/flyersoft/components/DragSort/SelectBar$2;->val$act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->doDictButton(Z)V

    :cond_6
    return-void
.end method
