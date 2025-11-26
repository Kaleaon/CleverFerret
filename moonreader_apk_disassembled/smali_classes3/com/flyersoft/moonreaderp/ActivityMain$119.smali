.class Lcom/flyersoft/moonreaderp/ActivityMain$119;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->doShelfImport(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$cb:Landroid/widget/CheckBox;

.field final synthetic val$edit:Landroid/widget/EditText;

.field final synthetic val$et:Landroid/widget/TextView;

.field final synthetic val$ll:Landroid/widget/LinearLayout;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/widget/TextView;Landroid/widget/LinearLayout;Landroid/widget/CheckBox;Landroid/widget/EditText;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 9981
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$119;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$119;->val$et:Landroid/widget/TextView;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$119;->val$ll:Landroid/widget/LinearLayout;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$119;->val$cb:Landroid/widget/CheckBox;

    iput-object p5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$119;->val$edit:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 9983
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$119;->val$et:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    sput-object p1, Lcom/flyersoft/tools/A;->scanPath:Ljava/lang/String;

    .line 9984
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$119;->val$ll:Landroid/widget/LinearLayout;

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->epub:I

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->importEpub:Z

    .line 9985
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$119;->val$ll:Landroid/widget/LinearLayout;

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->fb2:I

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->importFb2:Z

    .line 9986
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$119;->val$ll:Landroid/widget/LinearLayout;

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->chm:I

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->importChmUmd:Z

    .line 9987
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$119;->val$ll:Landroid/widget/LinearLayout;

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->mobi:I

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->importMobi:Z

    .line 9988
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$119;->val$ll:Landroid/widget/LinearLayout;

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->cbz:I

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->importCbz:Z

    .line 9989
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$119;->val$ll:Landroid/widget/LinearLayout;

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->umd:I

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->importDocRtf:Z

    .line 9990
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$119;->val$ll:Landroid/widget/LinearLayout;

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->html:I

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->importHtml:Z

    .line 9991
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$119;->val$ll:Landroid/widget/LinearLayout;

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->txt:I

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->importTxt:Z

    .line 9992
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$119;->val$ll:Landroid/widget/LinearLayout;

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->pdf:I

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->importPdf:Z

    .line 9994
    :try_start_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$119;->val$ll:Landroid/widget/LinearLayout;

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->sizeEt:I

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->importFileSize:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 9996
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 9999
    :goto_0
    const-string p1, ""

    sput-object p1, Lcom/flyersoft/tools/A;->scanFav:Ljava/lang/String;

    .line 10000
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$119;->val$cb:Landroid/widget/CheckBox;

    invoke-virtual {p2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p2

    if-eqz p2, :cond_0

    .line 10001
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$119;->val$edit:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p2

    sput-object p2, Lcom/flyersoft/tools/A;->scanFav:Ljava/lang/String;

    .line 10002
    sget-object p2, Lcom/flyersoft/tools/A;->scanFav:Ljava/lang/String;

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 10003
    const-string p1, "default_fav"

    sput-object p1, Lcom/flyersoft/tools/A;->scanFav:Ljava/lang/String;

    .line 10006
    :cond_0
    sget-object p1, Lcom/flyersoft/tools/A;->scanPath:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    const/4 p2, 0x1

    if-le p1, p2, :cond_1

    .line 10007
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$119;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget-object p2, Lcom/flyersoft/tools/A;->scanPath:Ljava/lang/String;

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfImportScanForBooks(Ljava/lang/String;)V

    :cond_1
    return-void
.end method
