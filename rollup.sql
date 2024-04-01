SELECT I_class,
       I_subclass,
       COUNT(*)
FROM s7.Item
GROUP BY ROLLUP(I_Class,I_subclass)
ORDER BY I_class NULLS LAST,
        I_subclass NULLS LAST;