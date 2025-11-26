.class public final Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;
.super Ljava/lang/Object;
.source "AddSecondaryEmailResult.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Serializer;,
        Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

.field private alreadyOwnedByUserValue:Ljava/lang/String;

.field private alreadyPendingValue:Ljava/lang/String;

.field private rateLimitedValue:Ljava/lang/String;

.field private reachedLimitValue:Ljava/lang/String;

.field private successValue:Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail;

.field private tooManyUpdatesValue:Ljava/lang/String;

.field private transientErrorValue:Ljava/lang/String;

.field private unavailableValue:Ljava/lang/String;

.field private unknownErrorValue:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 98
    new-instance v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->OTHER:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->withTag(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->OTHER:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 114
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;)Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail;
    .locals 0

    .line 36
    iget-object p0, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->successValue:Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;)Ljava/lang/String;
    .locals 0

    .line 36
    iget-object p0, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->unavailableValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$200(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;)Ljava/lang/String;
    .locals 0

    .line 36
    iget-object p0, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->alreadyPendingValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$300(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;)Ljava/lang/String;
    .locals 0

    .line 36
    iget-object p0, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->alreadyOwnedByUserValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$400(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;)Ljava/lang/String;
    .locals 0

    .line 36
    iget-object p0, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->reachedLimitValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$500(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;)Ljava/lang/String;
    .locals 0

    .line 36
    iget-object p0, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->transientErrorValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$600(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;)Ljava/lang/String;
    .locals 0

    .line 36
    iget-object p0, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->tooManyUpdatesValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$700(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;)Ljava/lang/String;
    .locals 0

    .line 36
    iget-object p0, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->unknownErrorValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$800(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;)Ljava/lang/String;
    .locals 0

    .line 36
    iget-object p0, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->rateLimitedValue:Ljava/lang/String;

    return-object p0
.end method

.method public static alreadyOwnedByUser(Ljava/lang/String;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;
    .locals 2

    if-eqz p0, :cond_2

    .line 546
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 549
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 552
    new-instance v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->ALREADY_OWNED_BY_USER:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->withTagAndAlreadyOwnedByUser(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    move-result-object p0

    return-object p0

    .line 550
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 547
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 255"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 544
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static alreadyPending(Ljava/lang/String;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;
    .locals 2

    if-eqz p0, :cond_2

    .line 488
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 491
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 494
    new-instance v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->ALREADY_PENDING:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->withTagAndAlreadyPending(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    move-result-object p0

    return-object p0

    .line 492
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 489
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 255"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 486
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static rateLimited(Ljava/lang/String;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;
    .locals 2

    if-eqz p0, :cond_2

    .line 839
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 842
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 845
    new-instance v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->RATE_LIMITED:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->withTagAndRateLimited(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    move-result-object p0

    return-object p0

    .line 843
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 840
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 255"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 837
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static reachedLimit(Ljava/lang/String;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;
    .locals 2

    if-eqz p0, :cond_2

    .line 605
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 608
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 611
    new-instance v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->REACHED_LIMIT:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->withTagAndReachedLimit(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    move-result-object p0

    return-object p0

    .line 609
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 606
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 255"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 603
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static success(Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;
    .locals 2

    if-eqz p0, :cond_0

    .line 379
    new-instance v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->SUCCESS:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->withTagAndSuccess(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    move-result-object p0

    return-object p0

    .line 377
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static tooManyUpdates(Ljava/lang/String;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;
    .locals 2

    if-eqz p0, :cond_2

    .line 722
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 725
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 728
    new-instance v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->TOO_MANY_UPDATES:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->withTagAndTooManyUpdates(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    move-result-object p0

    return-object p0

    .line 726
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 723
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 255"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 720
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static transientError(Ljava/lang/String;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;
    .locals 2

    if-eqz p0, :cond_2

    .line 663
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 666
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 669
    new-instance v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->TRANSIENT_ERROR:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->withTagAndTransientError(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    move-result-object p0

    return-object p0

    .line 667
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 664
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 255"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 661
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static unavailable(Ljava/lang/String;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;
    .locals 2

    if-eqz p0, :cond_2

    .line 430
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 433
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 436
    new-instance v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->UNAVAILABLE:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->withTagAndUnavailable(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    move-result-object p0

    return-object p0

    .line 434
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 431
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 255"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 428
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static unknownError(Ljava/lang/String;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;
    .locals 2

    if-eqz p0, :cond_2

    .line 780
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 783
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 786
    new-instance v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->UNKNOWN_ERROR:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->withTagAndUnknownError(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    move-result-object p0

    return-object p0

    .line 784
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 781
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 255"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 778
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;
    .locals 1

    .line 127
    new-instance v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;-><init>()V

    .line 128
    iput-object p1, v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    return-object v0
.end method

.method private withTagAndAlreadyOwnedByUser(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;
    .locals 1

    .line 213
    new-instance v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;-><init>()V

    .line 214
    iput-object p1, v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    .line 215
    iput-object p2, v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->alreadyOwnedByUserValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndAlreadyPending(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;
    .locals 1

    .line 190
    new-instance v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;-><init>()V

    .line 191
    iput-object p1, v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    .line 192
    iput-object p2, v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->alreadyPendingValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndRateLimited(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;
    .locals 1

    .line 326
    new-instance v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;-><init>()V

    .line 327
    iput-object p1, v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    .line 328
    iput-object p2, v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->rateLimitedValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndReachedLimit(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;
    .locals 1

    .line 236
    new-instance v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;-><init>()V

    .line 237
    iput-object p1, v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    .line 238
    iput-object p2, v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->reachedLimitValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndSuccess(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;
    .locals 1

    .line 146
    new-instance v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;-><init>()V

    .line 147
    iput-object p1, v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    .line 148
    iput-object p2, v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->successValue:Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail;

    return-object v0
.end method

.method private withTagAndTooManyUpdates(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;
    .locals 1

    .line 281
    new-instance v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;-><init>()V

    .line 282
    iput-object p1, v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    .line 283
    iput-object p2, v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->tooManyUpdatesValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndTransientError(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;
    .locals 1

    .line 258
    new-instance v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;-><init>()V

    .line 259
    iput-object p1, v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    .line 260
    iput-object p2, v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->transientErrorValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndUnavailable(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;
    .locals 1

    .line 168
    new-instance v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;-><init>()V

    .line 169
    iput-object p1, v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    .line 170
    iput-object p2, v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->unavailableValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndUnknownError(Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;
    .locals 1

    .line 303
    new-instance v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;-><init>()V

    .line 304
    iput-object p1, v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    .line 305
    iput-object p2, v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->unknownErrorValue:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 903
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    if-eqz v2, :cond_15

    .line 904
    check-cast p1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;

    .line 905
    iget-object v2, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 908
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$1;->$SwitchMap$com$dropbox$core$v2$team$AddSecondaryEmailResult$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    return v1

    :pswitch_0
    return v0

    .line 926
    :pswitch_1
    iget-object v2, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->rateLimitedValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->rateLimitedValue:Ljava/lang/String;

    if-eq v2, p1, :cond_4

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    return v1

    :cond_4
    :goto_0
    return v0

    .line 924
    :pswitch_2
    iget-object v2, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->unknownErrorValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->unknownErrorValue:Ljava/lang/String;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_1

    :cond_5
    return v1

    :cond_6
    :goto_1
    return v0

    .line 922
    :pswitch_3
    iget-object v2, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->tooManyUpdatesValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->tooManyUpdatesValue:Ljava/lang/String;

    if-eq v2, p1, :cond_8

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    goto :goto_2

    :cond_7
    return v1

    :cond_8
    :goto_2
    return v0

    .line 920
    :pswitch_4
    iget-object v2, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->transientErrorValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->transientErrorValue:Ljava/lang/String;

    if-eq v2, p1, :cond_a

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_9

    goto :goto_3

    :cond_9
    return v1

    :cond_a
    :goto_3
    return v0

    .line 918
    :pswitch_5
    iget-object v2, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->reachedLimitValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->reachedLimitValue:Ljava/lang/String;

    if-eq v2, p1, :cond_c

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_b

    goto :goto_4

    :cond_b
    return v1

    :cond_c
    :goto_4
    return v0

    .line 916
    :pswitch_6
    iget-object v2, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->alreadyOwnedByUserValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->alreadyOwnedByUserValue:Ljava/lang/String;

    if-eq v2, p1, :cond_e

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_d

    goto :goto_5

    :cond_d
    return v1

    :cond_e
    :goto_5
    return v0

    .line 914
    :pswitch_7
    iget-object v2, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->alreadyPendingValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->alreadyPendingValue:Ljava/lang/String;

    if-eq v2, p1, :cond_10

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_f

    goto :goto_6

    :cond_f
    return v1

    :cond_10
    :goto_6
    return v0

    .line 912
    :pswitch_8
    iget-object v2, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->unavailableValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->unavailableValue:Ljava/lang/String;

    if-eq v2, p1, :cond_12

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_11

    goto :goto_7

    :cond_11
    return v1

    :cond_12
    :goto_7
    return v0

    .line 910
    :pswitch_9
    iget-object v2, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->successValue:Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->successValue:Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail;

    if-eq v2, p1, :cond_14

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_13

    goto :goto_8

    :cond_13
    return v1

    :cond_14
    :goto_8
    return v0

    :cond_15
    return v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getAlreadyOwnedByUserValue()Ljava/lang/String;
    .locals 3

    .line 568
    iget-object v0, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->ALREADY_OWNED_BY_USER:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    if-ne v0, v1, :cond_0

    .line 571
    iget-object v0, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->alreadyOwnedByUserValue:Ljava/lang/String;

    return-object v0

    .line 569
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.ALREADY_OWNED_BY_USER, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getAlreadyPendingValue()Ljava/lang/String;
    .locals 3

    .line 509
    iget-object v0, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->ALREADY_PENDING:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    if-ne v0, v1, :cond_0

    .line 512
    iget-object v0, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->alreadyPendingValue:Ljava/lang/String;

    return-object v0

    .line 510
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.ALREADY_PENDING, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getRateLimitedValue()Ljava/lang/String;
    .locals 3

    .line 861
    iget-object v0, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->RATE_LIMITED:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    if-ne v0, v1, :cond_0

    .line 864
    iget-object v0, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->rateLimitedValue:Ljava/lang/String;

    return-object v0

    .line 862
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.RATE_LIMITED, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getReachedLimitValue()Ljava/lang/String;
    .locals 3

    .line 626
    iget-object v0, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->REACHED_LIMIT:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    if-ne v0, v1, :cond_0

    .line 629
    iget-object v0, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->reachedLimitValue:Ljava/lang/String;

    return-object v0

    .line 627
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.REACHED_LIMIT, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getSuccessValue()Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail;
    .locals 3

    .line 393
    iget-object v0, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->SUCCESS:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    if-ne v0, v1, :cond_0

    .line 396
    iget-object v0, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->successValue:Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail;

    return-object v0

    .line 394
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.SUCCESS, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getTooManyUpdatesValue()Ljava/lang/String;
    .locals 3

    .line 743
    iget-object v0, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->TOO_MANY_UPDATES:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    if-ne v0, v1, :cond_0

    .line 746
    iget-object v0, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->tooManyUpdatesValue:Ljava/lang/String;

    return-object v0

    .line 744
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.TOO_MANY_UPDATES, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getTransientErrorValue()Ljava/lang/String;
    .locals 3

    .line 684
    iget-object v0, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->TRANSIENT_ERROR:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    if-ne v0, v1, :cond_0

    .line 687
    iget-object v0, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->transientErrorValue:Ljava/lang/String;

    return-object v0

    .line 685
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.TRANSIENT_ERROR, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getUnavailableValue()Ljava/lang/String;
    .locals 3

    .line 451
    iget-object v0, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->UNAVAILABLE:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    if-ne v0, v1, :cond_0

    .line 454
    iget-object v0, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->unavailableValue:Ljava/lang/String;

    return-object v0

    .line 452
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.UNAVAILABLE, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getUnknownErrorValue()Ljava/lang/String;
    .locals 3

    .line 801
    iget-object v0, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->UNKNOWN_ERROR:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    if-ne v0, v1, :cond_0

    .line 804
    iget-object v0, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->unknownErrorValue:Ljava/lang/String;

    return-object v0

    .line 802
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.UNKNOWN_ERROR, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 12

    .line 880
    iget-object v0, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->successValue:Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail;

    iget-object v2, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->unavailableValue:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->alreadyPendingValue:Ljava/lang/String;

    iget-object v4, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->alreadyOwnedByUserValue:Ljava/lang/String;

    iget-object v5, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->reachedLimitValue:Ljava/lang/String;

    iget-object v6, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->transientErrorValue:Ljava/lang/String;

    iget-object v7, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->tooManyUpdatesValue:Ljava/lang/String;

    iget-object v8, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->unknownErrorValue:Ljava/lang/String;

    iget-object v9, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->rateLimitedValue:Ljava/lang/String;

    const/16 v10, 0xa

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object v0, v10, v11

    const/4 v0, 0x1

    aput-object v1, v10, v0

    const/4 v0, 0x2

    aput-object v2, v10, v0

    const/4 v0, 0x3

    aput-object v3, v10, v0

    const/4 v0, 0x4

    aput-object v4, v10, v0

    const/4 v0, 0x5

    aput-object v5, v10, v0

    const/4 v0, 0x6

    aput-object v6, v10, v0

    const/4 v0, 0x7

    aput-object v7, v10, v0

    const/16 v0, 0x8

    aput-object v8, v10, v0

    const/16 v0, 0x9

    aput-object v9, v10, v0

    invoke-static {v10}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public isAlreadyOwnedByUser()Z
    .locals 2

    .line 523
    iget-object v0, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->ALREADY_OWNED_BY_USER:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isAlreadyPending()Z
    .locals 2

    .line 465
    iget-object v0, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->ALREADY_PENDING:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 875
    iget-object v0, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->OTHER:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isRateLimited()Z
    .locals 2

    .line 815
    iget-object v0, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->RATE_LIMITED:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isReachedLimit()Z
    .locals 2

    .line 582
    iget-object v0, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->REACHED_LIMIT:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isSuccess()Z
    .locals 2

    .line 358
    iget-object v0, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->SUCCESS:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTooManyUpdates()Z
    .locals 2

    .line 698
    iget-object v0, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->TOO_MANY_UPDATES:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTransientError()Z
    .locals 2

    .line 640
    iget-object v0, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->TRANSIENT_ERROR:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUnavailable()Z
    .locals 2

    .line 407
    iget-object v0, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->UNAVAILABLE:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUnknownError()Z
    .locals 2

    .line 757
    iget-object v0, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->UNKNOWN_ERROR:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;
    .locals 1

    .line 347
    iget-object v0, p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 940
    sget-object v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 952
    sget-object v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
