.class Lcom/example2014/components/NumberPicker$InputTextFilter;
.super Landroid/text/method/NumberKeyListener;
.source "NumberPicker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example2014/components/NumberPicker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "InputTextFilter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/example2014/components/NumberPicker;


# direct methods
.method constructor <init>(Lcom/example2014/components/NumberPicker;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1983
    iput-object p1, p0, Lcom/example2014/components/NumberPicker$InputTextFilter;->this$0:Lcom/example2014/components/NumberPicker;

    invoke-direct {p0}, Landroid/text/method/NumberKeyListener;-><init>()V

    return-void
.end method


# virtual methods
.method public filter(Ljava/lang/CharSequence;IILandroid/text/Spanned;II)Ljava/lang/CharSequence;
    .locals 4

    .line 1999
    iget-object v0, p0, Lcom/example2014/components/NumberPicker$InputTextFilter;->this$0:Lcom/example2014/components/NumberPicker;

    invoke-static {v0}, Lcom/example2014/components/NumberPicker;->access$800(Lcom/example2014/components/NumberPicker;)[Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const-string v2, ""

    if-nez v0, :cond_3

    .line 2000
    invoke-super/range {p0 .. p6}, Landroid/text/method/NumberKeyListener;->filter(Ljava/lang/CharSequence;IILandroid/text/Spanned;II)Ljava/lang/CharSequence;

    move-result-object v0

    move v3, p6

    move p6, p5

    move-object p5, p4

    move p4, p3

    move p3, p2

    move-object p2, p1

    move-object p1, p0

    if-nez v0, :cond_0

    .line 2002
    invoke-interface {p2, p3, p4}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v0

    .line 2005
    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p5, v1, p6}, Landroid/text/Spanned;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p3

    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 2006
    invoke-interface {p5}, Landroid/text/Spanned;->length()I

    move-result p3

    invoke-interface {p5, v3, p3}, Landroid/text/Spanned;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 2008
    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_1

    return-object p2

    .line 2011
    :cond_1
    iget-object p3, p1, Lcom/example2014/components/NumberPicker$InputTextFilter;->this$0:Lcom/example2014/components/NumberPicker;

    invoke-static {p3, p2}, Lcom/example2014/components/NumberPicker;->access$900(Lcom/example2014/components/NumberPicker;Ljava/lang/String;)I

    move-result p2

    .line 2018
    iget-object p3, p1, Lcom/example2014/components/NumberPicker$InputTextFilter;->this$0:Lcom/example2014/components/NumberPicker;

    invoke-static {p3}, Lcom/example2014/components/NumberPicker;->access$1000(Lcom/example2014/components/NumberPicker;)I

    move-result p3

    if-le p2, p3, :cond_2

    return-object v2

    :cond_2
    return-object v0

    :cond_3
    move v3, p6

    move p6, p5

    move-object p5, p4

    move p4, p3

    move p3, p2

    move-object p2, p1

    move-object p1, p0

    .line 2024
    invoke-interface {p2, p3, p4}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p2

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 2025
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-eqz p3, :cond_4

    return-object v2

    .line 2028
    :cond_4
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p5, v1, p6}, Landroid/text/Spanned;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p4

    invoke-static {p4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 2029
    invoke-interface {p5}, Landroid/text/Spanned;->length()I

    move-result p2

    invoke-interface {p5, v3, p2}, Landroid/text/Spanned;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 2030
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p3

    .line 2031
    iget-object p4, p1, Lcom/example2014/components/NumberPicker$InputTextFilter;->this$0:Lcom/example2014/components/NumberPicker;

    invoke-static {p4}, Lcom/example2014/components/NumberPicker;->access$800(Lcom/example2014/components/NumberPicker;)[Ljava/lang/String;

    move-result-object p4

    array-length p5, p4

    :goto_0
    if-ge v1, p5, :cond_6

    aget-object v0, p4, v1

    .line 2032
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    .line 2033
    invoke-virtual {v3, p3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 2034
    iget-object p3, p1, Lcom/example2014/components/NumberPicker$InputTextFilter;->this$0:Lcom/example2014/components/NumberPicker;

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result p4

    invoke-static {p3, p2, p4}, Lcom/example2014/components/NumberPicker;->access$1100(Lcom/example2014/components/NumberPicker;II)V

    .line 2035
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result p2

    invoke-virtual {v0, p6, p2}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p2

    return-object p2

    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_6
    return-object v2
.end method

.method protected getAcceptedChars()[C
    .locals 1

    .line 1993
    invoke-static {}, Lcom/example2014/components/NumberPicker;->access$700()[C

    move-result-object v0

    return-object v0
.end method

.method public getInputType()I
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
